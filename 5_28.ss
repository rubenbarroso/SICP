(load "5_28/load-eceval.scm")

(define the-global-environment (setup-environment))

(start eceval)

;Iterative Factorial

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

;(total-pushes = 107 maximum-depth = 20)
;;; EC-Eval value:
;2

;;; EC-Eval input:
;(factorial 3)

;(total-pushes = 144 maximum-depth = 23)
;;; EC-Eval value:
;6

;;; EC-Eval input:
;(factorial 4)

;(total-pushes = 181 maximum-depth = 26)
;;; EC-Eval value:
;24

;;; EC-Eval input:
;(factorial 5)

;(total-pushes = 218 maximum-depth = 29)
;;; EC-Eval value:
;120

;;; EC-Eval input:
;(factorial 6)

;(total-pushes = 255 maximum-depth = 32)
;;; EC-Eval value:
;720


;Recursive Factorial

;;; EC-Eval input:
;(define (factorial n)
;  (if (= n 1)
;      1
;      (* (factorial (- n 1)) n)))

;(total-pushes = 3 maximum-depth = 3)
;;; EC-Eval value:
;ok

;;; EC-Eval input:
;(factorial 2)

;(total-pushes = 52 maximum-depth = 19)
;;; EC-Eval value:
;2

;;; EC-Eval input:
;(factorial 3)

;(total-pushes = 86 maximum-depth = 27)
;;; EC-Eval value:
;6

;;; EC-Eval input:
;(factorial 4)

;(total-pushes = 120 maximum-depth = 35)
;;; EC-Eval value:
;24

;;; EC-Eval input:
;(factorial 5)

;(total-pushes = 154 maximum-depth = 43)
;;; EC-Eval value:
;120

;;; EC-Eval input:
;(factorial 6)

;(total-pushes = 188 maximum-depth = 51)
;;; EC-Eval value:
;720


;see solution in yellow pad
