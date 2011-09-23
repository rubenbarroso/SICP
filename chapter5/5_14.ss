(load "ch5-performance.scm")

(define fact-machine
  (make-machine 
   '(n continue val)
   (list (list '= =)
         (list '- -)
         (list '* *)
         (list 'read read))
   '(init
     (assign continue (label fact-done))
     (assign n (op read))
     (perform (op initialize-stack))
     fact-loop
     (test (op =) (reg n) (const 1))
     (branch (label base-case))
     (save continue)
     (save n)
     (assign n (op -) (reg n) (const 1))
     (assign continue (label after-fact))
     (goto (label fact-loop))
     after-fact
     (restore n)
     (restore continue)
     (assign val (op *) (reg n) (reg val))
     (goto (reg continue))
     base-case
     (assign val (const 1))
     (goto (reg continue))
     fact-done
     (perform (op print-stack-statistics))
     (goto (label init)))))

;(set-register-contents! fact-machine 'n 3)
;(start fact-machine)
;3
;(total-pushes = 4 maximum-depth = 4)
;4
;(total-pushes = 6 maximum-depth = 6)
;5
;(total-pushes = 8 maximum-depth = 8)
;6
;(total-pushes = 10 maximum-depth = 10)
;7
;(total-pushes = 12 maximum-depth = 12)

;The function is linear, hence we have f(n) = an + b
;
;f(3) = 3a + b = 4
;f(4) = 4a + b = 6
;
;resolving that linear system, we have a = 2 and b = 2.
;Therefore, f(n) = 2n - 2
