(load "ch5-compiler.scm")
(load "load-eceval-compiler.scm")
(load "ch5-performance.scm")

;see yellow pad for solutions!

(compile-and-go
 '(define (factorial n)
    (if (= n 1)
        1
        (* (factorial (- n 1)) n))))

;(total-pushes = 0 maximum-depth = 0)
;;; EC-Eval value:
;ok

;;; EC-Eval input:
;(factorial 2)

;(total-pushes = 13 maximum-depth = 5)
;;; EC-Eval value:
;2

;;; EC-Eval input:
;(factorial 3)

;(total-pushes = 19 maximum-depth = 8)
;;; EC-Eval value:
;6

;;; EC-Eval input:
;(factorial 4)

;(total-pushes = 25 maximum-depth = 11)
;;; EC-Eval value:
;24

;;; EC-Eval input:
;(factorial 5)

;(total-pushes = 31 maximum-depth = 14)
;;; EC-Eval value:
;120

;;; EC-Eval input:
;(factorial 6)

;(total-pushes = 37 maximum-depth = 17)
;;; EC-Eval value:
;720

;***************************************************
;b
;To improve the compilation result we could get rid of the unneccessary preservation of continue and env. For example, open-coding the operation =,
;in order to eliminate unused branches, since we now it is a primitive operation.

