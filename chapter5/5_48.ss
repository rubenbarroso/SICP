(load "ch5-compiler-5_47.scm")
(load "load-eceval-compiler-5_47.scm")

;see definition of compile-and-run in ch5-eceval-compiler-5_47.scm (I reused those support files from the precious exercise)
(compile-and-go 
 '(define PI 3.141516))

;;;; EC-Eval value:
;ok

;;; EC-Eval input:
;(compile-and-run
; '(define (area r)
;   (* PI r r)))


;(total-pushes = 0 maximum-depth = 0)
;;; EC-Eval value:
;ok

;;; EC-Eval input:
;(area 4.0)

;(total-pushes = 5 maximum-depth = 3)
;;; EC-Eval value:
;50.264256
