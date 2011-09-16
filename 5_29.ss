(load "load-eceval.scm")

(define the-global-environment (setup-environment))

(start eceval)

;a
;See solution in yellow pad. f(n) = 5n + 3
;See solutions in yellow pad. S(n) = S(n-1) + S(n-2) + 40 (hence, k=40). Also, S(n) = 56Fib(n+1) - 40.

;;;; EC-Eval input:
;(define (fib n)
;  (if (< n 2)
;      n
;      (+ (fib (- n 1)) (fib (- n 2)))))

;(total-pushes = 3 maximum-depth = 3)
;;; EC-Eval value:
;ok

;;; EC-Eval input:
;(fib 2)

;(total-pushes = 72 maximum-depth = 13)
;;; EC-Eval value:
;1

;;; EC-Eval input:
;(fib 3)

;(total-pushes = 128 maximum-depth = 18)
;;; EC-Eval value:
;2

;;; EC-Eval input:
;(fib 4)

;(total-pushes = 240 maximum-depth = 23)
;;; EC-Eval value:
;3

;;; EC-Eval input:
;(fib 5)

;(total-pushes = 408 maximum-depth = 28)
;;; EC-Eval value:
;5

;;; EC-Eval input:
;(fib 6)

;(total-pushes = 688 maximum-depth = 33)
;;; EC-Eval value:
;8

;;; EC-Eval input:
;(fib 7)

;(total-pushes = 1136 maximum-depth = 38)
;;; EC-Eval value:
;13