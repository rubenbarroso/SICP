(load "ch5-performance.scm")

;a
(define count-leaves-machine-rec
  (make-machine
   '(tree continue val temp)
   (list (list 'null? null?)
         (list 'pair? pair?)
         (list 'car car)
         (list 'cdr cdr)
         (list '+ +))
   '((assign continue (label count-leaves-done))
     count-leaves-loop
     (test (op null?) (reg tree))
     (branch (label empty-tree))
     (test (op pair?) (reg tree))
     (branch (label pair-tree))
     (assign val (const 1))
     (goto (reg continue))
     empty-tree
     (assign val (const 0))
     (goto (reg continue))
     pair-tree
     (save continue)
     (assign temp (op cdr) (reg tree))
     (save temp)
     (assign tree (op car) (reg tree))
     (assign continue (label after-car))
     (goto (label count-leaves-loop))
     after-car
     (restore temp)
     (assign tree (reg temp))
     (save val)
     (assign continue (label after-cdr))
     (goto (label count-leaves-loop))
     after-cdr
     (restore continue)
     (assign val (op +) (reg val) (reg continue))
     (restore continue)
     (goto (reg continue))
     count-leaves-done)))

;(set-register-contents! count-leaves-machine-rec 'tree '(1 (2 3) (4 5 6) 7 ((8 9) 10)))
;(start count-leaves-machine-rec)
;(get-register-contents count-leaves-machine-rec 'val)
;
;10

;b
(define count-leaves-machine-iter
  (make-machine
   '(tree continue n temp)
   (list (list 'null? null?)
         (list 'pair? pair?)
         (list 'car car)
         (list 'cdr cdr)
         (list '+ +))
   '((assign continue (label count-leaves-done))
     (assign n (const 0))
     count-iter
     (test (op null?) (reg tree))
     (branch (label empty-tree))
     (test (op pair?) (reg tree))
     (branch (label pair-tree))
     (assign n (op +) (reg n) (const 1))
     empty-tree
     (goto (reg continue))
     pair-tree
     (save continue)
     (assign temp (op cdr) (reg tree))
     (save temp)
     (assign tree (op car) (reg tree))
     (assign continue (label after-car))
     (goto (label count-iter))
     after-car
     (restore temp)
     (assign tree (reg temp))
     (assign continue (label after-cdr))
     (goto (label count-iter))
     after-cdr
     (restore continue)
     (goto (reg continue))
     count-leaves-done)))

;(set-register-contents! count-leaves-machine-iter 'tree '(1 (2 3) (4 5 6) 7 ((8 9) 10)))
;(start count-leaves-machine-iter)
;(get-register-contents count-leaves-machine-iter 'n)
;
;10
