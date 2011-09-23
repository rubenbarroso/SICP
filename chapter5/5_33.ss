(load "text/ch5-compiler.scm")

(compile 
 '(define (factorial-alt n)
    (if (= n 1)
        1
        (* n (factorial-alt (- n 1)))))
 'val
 'next)

;generated code for factorial-alt - See 5_33b.ss

;Both programs should have the same time/space complexity because they have the same amount of instructions (assignments, save and restores)
