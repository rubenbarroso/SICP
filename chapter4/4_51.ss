(load "text/ch4-ambeval.scm")

(define the-global-environment (setup-environment))

;see changes in ch4-ambeval.scm

;paste the following after doing (driver-loop)
(define (require p)
  (if (not p) (amb)))

(define (an-element-of items)
  (require (not (null? items)))
  (amb (car items) (an-element-of (cdr items))))

(define count 0)

(let ((x (an-element-of '(a b c)))
      (y (an-element-of '(a b c))))
  (permanent-set! count (+ count 1))
  (require (not (eq? x y)))
  (list x y count))

;;; Starting a new problem 
;;; Amb-Eval value:
;(a b 2)

;;; Amb-Eval input:
;try-again

;;; Amb-Eval value:
;(a c 3)

;If we had used set!, we can see in the execution below that the value of count is reset each time a new try is carried out
(define (require p)
  (if (not p) (amb)))

(define (an-element-of items)
  (require (not (null? items)))
  (amb (car items) (an-element-of (cdr items))))

(define count 0)

(let ((x (an-element-of '(a b c)))
      (y (an-element-of '(a b c))))
  (set! count (+ count 1))
  (require (not (eq? x y)))
  (list x y count))

;;; Starting a new problem 
;;; Amb-Eval value:
;(a b 1)

;;; Amb-Eval input:
;try-again

;;; Amb-Eval value:
;(a c 1)
