(load "ch5-performance.scm")

(define (append x y)
  (if (null? x)
      y
      (cons (car x) (append (cdr x) y))))

(define append-machine
  (make-machine
   '(x y continue temp)
   (list (list 'null? null?)
         (list 'cons cons)
         (list 'car car)
         (list 'cdr cdr))
   '((assign continue (label append-done))
     append-loop
     (test (op null?) (reg x))
     (branch (label base-case))
     (save continue)
     (assign temp (op car) (reg x))
     (save temp)
     (assign x (op cdr) (reg x))
     (assign continue (label after-cdr))
     (goto (label append-loop))
     after-cdr
     (restore temp)
     (restore continue)
     (assign y (op cons) (reg temp) (reg y))
     (goto (reg continue))
     base-case
     (goto (reg continue))
     append-done)))

;(set-register-contents! append-machine 'x '(1 2))
;(set-register-contents! append-machine 'y '(3 4 5))
;(start append-machine)
;(get-register-contents append-machine 'x)
;(get-register-contents append-machine 'y)
;
;()
;(1 2 3 4 5)

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define append!-machine
  (make-machine
   '(x y pointer temp)
   (list (list 'null? null?)
         (list 'cdr cdr)
         (list 'set-cdr! set-cdr!))    
   '((assign pointer (reg x))
     last-pair
     (assign temp (op cdr) (reg pointer))
     (test (op null?) (reg temp))
     (branch (label base-case))
     (assign pointer (reg temp))
     (goto (label last-pair))
     base-case
     (perform (op set-cdr!) (reg pointer) (reg y)))))

;(set-register-contents! append!-machine 'x '(1 2))
;(set-register-contents! append!-machine 'y '(3 4 5))
;(start append!-machine)
;(get-register-contents append!-machine 'x)
;
;(1 2 3 4 5)
