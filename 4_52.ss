(load "text/ch4-ambeval.scm")

(define the-global-environment (setup-environment))

;see changes in ch4-ambeval.scm

;paste the following after doing (driver-loop)
(define (require p)
  (if (not p) (amb)))

(define (an-element-of items)
  (require (not (null? items)))
  (amb (car items) (an-element-of (cdr items))))

(if-fail (let ((x (an-element-of '(1 3 5))))
           (require (even? x))
           x)
         'all-odd)

;;; Starting a new problem 
;;; Amb-Eval value:
;all-odd

(if-fail (let ((x (an-element-of '(1 3 5 8))))
           (require (even? x))
           x)
         'all-odd)

;;; Starting a new problem 
;;; Amb-Eval value:
;8
