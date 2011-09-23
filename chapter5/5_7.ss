(load "text/ch5-regsim.scm")

(define expt-recursive-machine
  (make-machine
   '(n b continue val)
   (list (list '= =)
         (list '- -)
         (list '* *))
   '((assign continue (label expt-done))
     expt-loop
     (test (op =) (reg n) (const 0))
     (branch (label base-case))
     (save continue)
     (assign n (op -) (reg n) (const 1))
     (assign continue (label after-expt))
     (goto (label expt-loop))
     after-expt
     (restore continue)
     (assign val (op *) (reg b) (reg val))
     (goto (reg continue))
     base-case
     (assign val (const  1))
     (goto (reg continue))
     expt-done)))

;(set-register-contents! expt-recursive-machine 'b 2)
;(set-register-contents! expt-recursive-machine 'n 3)
;(start expt-recursive-machine)
;(get-register-contents expt-recursive-machine 'val)
;
;done
;done
;done
;8

(define expt-iterative-machine
  (make-machine
   '(n b product counter)
   (list (list '= =)
         (list '- -)
         (list '* *))
   '((assign counter (reg n))
     (assign product (const 1))
     expt-loop
     (test (op =) (reg counter) (const 0))
     (branch (label expt-done))
     (assign counter (op -) (reg counter) (const 1))
     (assign product (op *) (reg product) (reg b))
     (goto (label expt-loop))
     expt-done)))

;(set-register-contents! expt-recursive-machine 'b 2)
;(set-register-contents! expt-recursive-machine 'n 3)
;(start expt-recursive-machine)
;(get-register-contents expt-recursive-machine 'val)
;
;done
;done
;done
;8
