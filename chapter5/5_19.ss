(load "ch5-performance_5_19.scm")

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

(set-breakpoint expt-machine 'after-expt 2)

(set-register-contents! expt-machine 'b 2)
(set-register-contents! expt-machine 'n 3)
(start expt-machine)
(get-register-contents expt-machine 'val)
(proceed-machine expt-machine)
(get-register-contents expt-machine 'val)
(cancel-breakpoint expt-machine 'after-expt 2)
(proceed-machine expt-machine)
(get-register-contents expt-machine 'val)

;
po;breakpoint at (goto (reg continue))
;2
;breakpoint at (goto (reg continue))
;4
;8