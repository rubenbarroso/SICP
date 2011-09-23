(load "ch5-compiler-5_47.scm")
(load "load-eceval-compiler-5_47.scm")

(define the-global-environment (setup-environment))

(define (compile-helper exp)
  (assemble
   (statements
    (compile exp
             'val
             'return))
   rcepl-machine))

(define rcepl-operations
  (cons (list 'compile compile-helper)
        eceval-operations))

;very similar to eceval machine (see ch5-eceval-compiler-5_47.scm)
(define rcepl-machine
  (make-machine 
   '(exp continue val env proc argl compapp)
   rcepl-operations
   '(rcepl
     (perform (op initialize-stack))
     (perform (op prompt-for-input) (const ";;; EC input:"))
     (assign exp (op read))
     (assign env (op get-global-environment))
     (assign val (op compile) (reg exp)) ;this assembles the expression into rcepl-machine
     (assign continue (label print))
     (goto (reg val))
     print
     (perform (op announce-output) (const ";;; EC value:"))
     (perform (op user-print) (reg val))
     (goto (label rcepl)))))

;test
(start rcepl-machine)

;;; EC input:
;(define PI 3.141516)

;;; EC value:
;ok

;;; EC input:
;(define (area r)
;   (* PI r r))

;;; EC value:
;ok

;;; EC input:
;(area (+ 2 2))

;;; EC value:
;50.264256
