(load "text/ch4-ambeval.scm")

(define the-global-environment (setup-environment))

;paste the following after doing (driver-loop)
(define (require p)
  (if (not p) (amb)))

(define (distinct? items)
  (cond ((null? items) true)
        ((null? (cdr items)) true)
        ((member (car items) (cdr items)) false)
        (else (distinct? (cdr items)))))

(define (liars)
  (let ((first (amb 'Betty 'Ethel 'Joan 'Kitty 'Mary))
        (second (amb 'Betty 'Ethel 'Joan 'Kitty 'Mary))
        (third (amb 'Betty 'Ethel 'Joan 'Kitty 'Mary))
        (fourth (amb 'Betty 'Ethel 'Joan 'Kitty 'Mary))
        (fifth (amb 'Betty 'Ethel 'Joan 'Kitty 'Mary)))
    (require (xor (eq? second 'Kitty) (eq? third 'Betty)))
    (require (xor (eq? first 'Ethel) (eq? second 'Joan)))
    (require (xor (eq? third 'Joan) (eq? fifth 'Ethel)))
    (require (xor (eq? second 'Kitty) (eq? fourth 'Mary)))
    (require (xor (eq? fourth 'Mary) (eq? first 'Betty)))
    (require
     (distinct? (list first second third fourth fifth)))
    (list (list '1st first)
          (list '2nd second)
          (list '3rd third)
          (list '4th fourth)
          (list '5th fifth))))

(liars)

;;; Amb-Eval input:
;(liars)

;;; Starting a new problem 
;;; Amb-Eval value:
;((1st Kitty) (2nd Joan) (3rd Betty) (4th Mary) (5th Ethel))

;;; Amb-Eval input:
;try-again

;;; There are no more values of
;(liars)
