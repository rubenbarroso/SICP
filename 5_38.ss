(load "text/ch5-compiler-5_38.scm")

;see changed code in text/ch5-compiler-5_38.scm

;small test
'(compile 
 '(+ 5 6)
 'val
 'next)

;compiler output
'((assign arg1 (const 5)) 
  (assign arg2 (const 6)) 
  (assign val (op +) (reg arg1) (reg arg2)))

(compile 
 '(define (factorial-alt n)
    (if (= n 1)
        1
        (* n (factorial-alt (- n 1)))))
 'val
 'next)

;factorial compiler output
'((assign val (op make-compiled-procedure) (label entry1) (reg env))
  (goto (label after-lambda2))
  entry1
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (n)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const =) (reg env))
  (assign val (const 1))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const n) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch6))
  compiled-branch7
  (assign continue (label after-call8))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
  primitive-branch6
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  after-call8
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch4))
  true-branch3
  (assign val (const 1))
  (goto (reg continue))
  false-branch4
  (save continue)
  (assign arg1 (op lookup-variable-value) (const n) (reg env))
  (save arg1)
  (assign proc (op lookup-variable-value) (const factorial-alt) (reg env))
  (assign arg1 (op lookup-variable-value) (const n) (reg env))
  (assign arg2 (const 1))
  (assign val (op -) (reg arg1) (reg arg2))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch9))
  compiled-branch10
  (assign continue (label proc-return12))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
  proc-return12
  (assign arg2 (reg val))
  (goto (label after-call11))
  primitive-branch9
  (assign arg2 (op apply-primitive-procedure) (reg proc) (reg argl))
  after-call11
  (restore arg1)
  (assign val (op *) (reg arg1) (reg arg2))
  (restore continue)
  (goto (reg continue))
  after-if5
  after-lambda2
  (perform (op define-variable!) (const factorial-alt) (reg val) (reg env))
  (assign val (const ok)))

;we can see that the evaluations of the open-coded primitives are generated as expected