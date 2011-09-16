;a
;we can turn:
;
;(assign n (reg val))
;(restore val)
;
;into:
;
;(restore n)

;b
(define (make-save inst machine stack pc)
  (let* ((reg-name (stack-inst-reg-name inst))
         (reg (get-register machine reg-name)))
    (lambda ()
      (push stack (cons (get-contents reg)))
      (advance-pc pc))))

(define (make-restore inst machine stack pc)
  (let* ((reg-name (stack-inst-reg-name inst))
         (reg (get-register machine reg-name)))
    (lambda ()
      (let ((top (pop stack))
            (top-name (car top))
            (top-contents (cdr top)))
        (if (eq? reg-name top-name)
            (begin
              (set-contents! reg top-contents)    
              (advance-pc pc))
            (error "Wrong register name in restore" reg-name))))))

;c
(define (make-stack)
  (let ((sub-stacks '()))
    (define (push reg-name x)
      (let ((sub-stack (assoc reg-name sub-stacks)))
        (set-cdr! sub-stack (cons x (cdr sub-stack)))))
    (define (pop reg-name)
      (let ((sub-stack (assoc reg-name sub-stacks)))
        (if (null? (cdr sub-stack))
            (error "Empty sub-stack - POP" sub-stack)
            (let ((top (cadr sub-stack)))
              (set-cdr! sub-stack (cddr sub-stack))
              top))))
    (define (add-sub-stack reg-name)
      (set! sub-stacks (cons (cons reg-name nil) sub-stacks))
      'done)
    (define (initialize reg-names)
      (for-each add-sub-stack reg-names))
    (define (dispatch message)
      (cond ((eq? message 'push) push)
            ((eq? message 'pop) pop)
            ((eq? message 'initialize) (initialize))
            ((eq? message 'add-sub-stack) add-sub-stack)
            (else (error "Unknown request - STACK"
                         message))))
    dispatch))

(define (pop stack reg-name)
  ((stack 'pop) reg-name))

(define (push stack reg-name value)
  ((stack 'push) reg-name value))

(define (add-sub-stack stack reg-name)
  ((stack 'add-sub-stack) reg-name))

(define (make-save inst machine stack pc)
  (let* ((reg-name (stack-inst-reg-name inst))
         (reg (get-register machine reg-name)))
    (lambda ()
      (push stack reg-name (get-contents reg))
      (advance-pc pc))))

(define (make-restore inst machine stack pc)
  (let* ((reg-name (stack-inst-reg-name inst))
         (reg (get-register machine reg-name)))
    (lambda ()
      (set-contents! reg (pop stack reg-name))    
      (advance-pc pc))))

;within make-new-machine
(define (allocate-register name)
  (if (assoc name register-table)
      (error "Multiply defined register: " name)
      (begin
        (set! register-table
              (cons (list name (make-register name))
                    register-table))
        ((stack 'add-sub-stack) name)
        'done)))
