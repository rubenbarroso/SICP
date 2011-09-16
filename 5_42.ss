(load "text/ch5-compiler-5_40.scm")

(compile 
 '(((lambda (a b c d e)
      ((lambda (y z) (* x y z))
       (* a b x)
       (+ c d x)))))
 'val
 'next
 '())

;compilation output
'((assign proc (op make-compiled-procedure) (label entry1) (reg env))
  (goto (label after-lambda2))
  entry1
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (a b c d e)) (reg argl) (reg env))
  (assign proc (op make-compiled-procedure) (label entry3) (reg env))
  (goto (label after-lambda4))
  entry3
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (y z)) (reg argl) (reg env))
  (assign proc (op lexical-address-lookup) (const not-found) (reg env))
  (assign val (op lexical-address-lookup) (const (0 1)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (op lexical-address-lookup) (const not-found) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch5))
  compiled-branch6
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
  primitive-branch5
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
  after-call7
  after-lambda4
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lexical-address-lookup) (const not-found) (reg env))
  (assign val (op lexical-address-lookup) (const not-found) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 3)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (op lexical-address-lookup) (const (0 2)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch11))
  compiled-branch12
  (assign continue (label after-call13))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
  primitive-branch11
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  after-call13
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lexical-address-lookup) (const not-found) (reg env))
  (assign val (op lexical-address-lookup) (const not-found) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 1)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (op lexical-address-lookup) (const (0 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch8))
  compiled-branch9
  (assign continue (label after-call10))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
  primitive-branch8
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  after-call10
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch14))
  compiled-branch15
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
  primitive-branch14
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
  after-call16
  after-lambda2
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch17))
  compiled-branch18
  (assign continue (label proc-return20))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
  proc-return20
  (assign proc (reg val))
  (goto (label after-call19))
  primitive-branch17
  (assign proc (op apply-primitive-procedure) (reg proc) (reg argl))
  after-call19
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch21))
  compiled-branch22
  (assign continue (label after-call23))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
  primitive-branch21
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  after-call23)