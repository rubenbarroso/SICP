(load "5_12_reg_sim.scm")

(define fib-machine
  (make-machine
   '(n val continue)
   (list (list '= =)
         (list '< <)
         (list '+ +)
         (list '- -))
   '((assign continue (label fib-done))
     fib-loop
     (test (op <) (reg n) (const 2))
     (branch (label immediate-answer))
     ;; set up to compute Fib(n - 1)
     (save continue)
     (assign continue (label afterfib-n-1))
     (save n)                           ; save old value of n
     (assign n (op -) (reg n) (const 1)); clobber n to n - 1
     (goto (label fib-loop))            ; perform recursive call
     afterfib-n-1                         ; upon return, val contains Fib(n - 1)
     (restore n)
     (restore continue)
     ;; set up to compute Fib(n - 2)
     (assign n (op -) (reg n) (const 2))
     (save continue)
     (assign continue (label afterfib-n-2))
     (save val)                         ; save Fib(n - 1)
     (goto (label fib-loop))
     afterfib-n-2                         ; upon return, val contains Fib(n - 2)
     (assign n (reg val))               ; n now contains Fib(n - 2)
     (restore val)                      ; val now contains Fib(n - 1)
     (restore continue)
     (assign val                        ;  Fib(n - 1) +  Fib(n - 2)
             (op +) (reg val) (reg n))
     (goto (reg continue))              ; return to caller, answer is in val
     immediate-answer
     (assign val (reg n))               ; base case:  Fib(n) = n
     (goto (reg continue))
     fib-done)))

;(set-register-contents! fib-machine 'n 3)

;(fib-machine 'instructions-by-type)
;
;((restore (restore continue) (restore val) (restore continue) (restore n))
; (goto (goto (reg continue)) (goto (reg continue)) (goto (label fib-loop)) (goto (label fib-loop)))
; (save (save val) (save continue) (save n) (save continue))
; (branch (branch (label immediate-answer)))
; (test (test (op <) (reg n) (const 2)))
; (assign
;  (assign val (reg n))
;  (assign val (op +) (reg val) (reg n))
;  (assign n (reg val))
;  (assign continue (label afterfib-n-2))
;  (assign n (op -) (reg n) (const 2))
;  (assign n (op -) (reg n) (const 1))
;  (assign continue (label afterfib-n-1))
;  (assign continue (label fib-done))))

;(fib-machine 'entry-points)
;
;(continue)

;(fib-machine 'stack-registers)
;
;(val n continue)

;(fib-machine 'register-sources)
;
;((val ((reg n)) ((op +) (reg val) (reg n)))
; (n ((reg val)) ((op -) (reg n) (const 2)) ((op -) (reg n) (const 1)))
; (continue ((label afterfib-n-2)) ((label afterfib-n-1)) ((label fib-done))))