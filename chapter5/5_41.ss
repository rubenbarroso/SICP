(define (make-lexical-address frame-number displacement)
  (list frame-number displacement))

(define (frame-number lexical-address)
  (car lexical-address))

(define (displacement lexical-address)
  (cadr lexical-address))

(define (index-of item a-list)
  (define (iter rest count)
    (cond ((null? rest) 'not-found)
          ((eq? item (car rest)) count)
          (else (iter (cdr rest) (+ count 1)))))
  (iter a-list 0))

;(index-of 'c '(a b c d e))
;2
;(index-of 'f '(a b c d e))
;()

(define (find-variable var cenv)
  (define (iter frames frame-number)
    (if (null? frames)
        'not-found
        (let ((index-of-var (index-of var (car frames))))
          (if (not (eq? index-of-var 'not-found))
              (make-lexical-address frame-number index-of-var)
              (iter (cdr frames) (+ frame-number 1))))))
  (iter cenv 0))

;(find-variable 'c '((y z) (a b c d e) (x y)))
;(1 2)
;(find-variable 'x '((y z) (a b c d e) (x y)))
;(2 0)
;(find-variable 'w '((y z) (a b c d e) (x y)))
;not-found