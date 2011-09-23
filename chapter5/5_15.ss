(load "ch5-performance.scm")

(define expt-machine
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

(set-register-contents! expt-machine 'b 2)
(set-register-contents! expt-machine 'n 3)
(start expt-machine)
(expt-machine 'print-instruction-count)
(expt-machine 'reset-instruction-count)
(expt-machine 'print-instruction-count)
(set-register-contents! expt-machine 'b 3)
(set-register-contents! expt-machine 'n 4)
(start expt-machine)
(expt-machine 'print-instruction-count)
;
;instruction count: 32
;instruction count: 0
;instruction count: 41
