(load "load-eceval.scm")

(define the-global-environment (setup-environment))

(start eceval)

;;; EC-Eval input:
;(define (factorial n)
;  (define (iter product counter)
;    (if (> counter n)
;        product
;        (iter (* counter product)
;              (+ counter 1))))
;  (iter 1 1))


;(total-pushes = 3 maximum-depth = 3)
;;; EC-Eval value:
;ok

;;; EC-Eval input:
;(factorial 2)

;(total-pushes = 99 maximum-depth = 10)
;;; EC-Eval value:
;2

;;; EC-Eval input:
;(factorial 3)

;(total-pushes = 134 maximum-depth = 10)
;;; EC-Eval value:
;6

;;; EC-Eval input:
;(factorial 4)

;(total-pushes = 169 maximum-depth = 10)
;;; EC-Eval value:
;24

;;; EC-Eval input:
;(factorial 5)

;(total-pushes = 204 maximum-depth = 10)
;;; EC-Eval value:
;120

;;; EC-Eval input:
;(factorial 6)

;(total-pushes = 239 maximum-depth = 10)
;;; EC-Eval value:
;720



;a
;maximum-depth = 10

;b
;See yellow pad. Solution: f(n) = 35n + 29