(load "ch5-compiler-5_47.scm")
(load "load-eceval-compiler-5_47.scm")

;see changes in ch5-compiler-5_47.scm

(compile-and-go
 '(define (f n)
    (* 4 (g n))))

;;; EC-Eval value:
;ok

;;; EC-Eval input:
;(define (g n) (+ n 3))

;(total-pushes = 3 aximum-depth = 3)
;;; EC-Eval value:
;ok

;;; EC-Eval input:
;(f 7)

;(total-pushes = 16 maximum-depth = 7)
;;; EC-Eval value:
;40
