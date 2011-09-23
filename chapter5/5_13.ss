(load "5_13_reg_sim.scm")

;this is really easy, we just need to:
;1. remove the registers operand from make-machine and their pre-allocating code
;2. modify the procedures lookup-register and get-register internal to make-new-machine. They will create the registers lazily

;Test
(define expt-recursive-machine
  (make-machine
   ;no records argument
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