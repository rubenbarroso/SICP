(load "ch5-compiler.scm")
(load "load-eceval-compiler.scm")
(load "ch5-performance.scm")

;see yellow pad for solutions!
;see 4_56b for the special-purpose fibonacci machine statistics

(compile-and-go
 '(define (fib n)
    (if (< n 2)
        n
        (+ (fib (- n 1)) (fib (- n 2))))))

;;;; EC-Eval input:
;(fib 2)

;(total-pushes = 17 maximum-depth = 5)
;;; EC-Eval value:
;1

;;; EC-Eval input:
;(fib 3)

;(total-pushes = 27 maximum-depth = 8)
;;; EC-Eval value:
;2

;;; EC-Eval input:
;(fib 4)

;(total-pushes = 47 maximum-depth = 11)
;;; EC-Eval value:
;3

;;; EC-Eval input:
;(fib 5)

;(total-pushes = 77 maximum-depth = 14)
;;; EC-Eval value:
;5

;;; EC-Eval input:
;(fib 6)

;(total-pushes = 127 maximum-depth = 17)
;;; EC-Eval value:
;8

;;; EC-Eval input:
;(fib 7)

;(total-pushes = 207 maximum-depth = 20)
;;; EC-Eval value:
;13