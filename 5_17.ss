(load "ch5-performance_5_17.scm")

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

(trace-on expt-machine)
(set-register-contents! expt-machine 'b 2)
(set-register-contents! expt-machine 'n 3)
(start expt-machine)

;1 (assign continue (label expt-done))
;labels: expt-loop 
;2 (test (op =) (reg n) (const 0))
;3 (branch (label base-case))
;4 (save continue)
;5 (assign n (op -) (reg n) (const 1))
;6 (assign continue (label after-expt))
;7 (goto (label expt-loop))
;labels: expt-loop 
;8 (test (op =) (reg n) (const 0))
;9 (branch (label base-case))
;10 (save continue)
;11 (assign n (op -) (reg n) (const 1))
;12 (assign continue (label after-expt))
;13 (goto (label expt-loop))
;labels: expt-loop 
;14 (test (op =) (reg n) (const 0))
;15 (branch (label base-case))
;16 (save continue)
;17 (assign n (op -) (reg n) (const 1))
;18 (assign continue (label after-expt))
;19 (goto (label expt-loop))
;labels: expt-loop 
;20 (test (op =) (reg n) (const 0))
;21 (branch (label base-case))
;labels: base-case 
;22 (assign val (const 1))
;23 (goto (reg continue))
;labels: after-expt 
;24 (restore continue)
;25 (assign val (op *) (reg b) (reg val))
;26 (goto (reg continue))
;labels: after-expt 
;27 (restore continue)
;28 (assign val (op *) (reg b) (reg val))
;29 (goto (reg continue))
;labels: after-expt 
;30 (restore continue)
;31 (assign val (op *) (reg b) (reg val))
;32 (goto (reg continue))

