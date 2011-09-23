(load "ch5-performance.scm")

;see yellow-pad!

(define fib-machine
  (make-machine 
   '(n continue val)
   (list (list '= =)
         (list '+ -)
         (list '- -)
         (list '* *)
         (list '< <)
         (list 'read read))
   '(init
     (assign continue (label fib-done))
     (assign n (op read))
     (perform (op initialize-stack))
     fib-loop
     (test (op <) (reg n) (const 2))
     (branch (label immediate-answer))
     ;; set up to compute Fib(n-1)
     (save continue)
     (assign continue (label afterfib-n-1))
     (save n)                           ; save old value of n
     (assign n (op -) (reg n) (const 1)); clobber n to n-1
     (goto (label fib-loop))            ; perform recursive call
     afterfib-n-1                         ; upon return, val contains Fib(n-1)
     (restore n)
     (restore continue)
     ;; set up to compute Fib(n-2)
     (assign n (op -) (reg n) (const 2))
     (save continue)
     (assign continue (label afterfib-n-2))
     (save val)                         ; save Fib(n-1)
     (goto (label fib-loop))
     afterfib-n-2                         ; upon return, val contains Fib(n-2)
     (assign n (reg val))               ; n now contains Fib(n-2)
     (restore val)                      ; val now contains Fib(n-1)
     (restore continue)
     (assign val                        ; Fib(n-1)+Fib(n-2)
             (op +) (reg val) (reg n)) 
     (goto (reg continue))              ; return to caller, answer is in val
     immediate-answer
     (assign val (reg n))               ; base case: Fib(n)=n
     (goto (reg continue))
     fib-done
     (perform (op print-stack-statistics))
     (goto (label init)))))

(set-register-contents! fib-machine 'n 3)
(start fib-machine)
;2
;(total-pushes = 4 maximum-depth = 2)
;3
;(total-pushes = 8 maximum-depth = 4)
;4
;(total-pushes = 16 maximum-depth = 6)
;5
;(total-pushes = 28 maximum-depth = 8)
;6
;(total-pushes = 48 maximum-depth = 10)
;7
;(total-pushes = 80 maximum-depth = 12)