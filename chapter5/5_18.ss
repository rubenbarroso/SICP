(load "ch5-performance_5_18.scm")

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

(reg-trace-on expt-machine 'n)
(reg-trace-on expt-machine 'val)
(set-register-contents! expt-machine 'b 2)
(set-register-contents! expt-machine 'n 3)
(start expt-machine)

;n [old: *unassigned*, 3]
;n [old: 3, 2]
;n [old: 2, 1]
;n [old: 1, 0]
;val [old: *unassigned*, 1]
;val [old: 1, 2]
;val [old: 2, 4]
;val [old: 4, 8]
