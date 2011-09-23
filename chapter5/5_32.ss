;combinations with no operands as a special case
;ev-appl-did-operator
;  (restore unev)                  ; the operands
;  (restore env)
;  (assign argl (op empty-arglist))
;  (assign proc (reg val))         ; the operator
;  (test (op no-operands?) (reg unev))
;  (branch (label apply-dispatch))
;  (save proc)
  
;a
ev-application
  (save continue)
  (save env)
  (assign unev (op operands) (reg exp))
  (save unev)
  (test (op operator-symbol?) (reg exp))
  (branch (label ev-appl-did-operator-symbol))
  (assign exp (op operator) (reg exp))
  (assign continue (label ev-appl-did-operator))
  (goto (label eval-dispatch))
ev-appl-did-operator-symbol  
  (assign proc (op operator) (reg exp))
  (assign val (op lookup-variable-value) (reg proc) (reg env)) ;val reused in ev-apl-did-operator
ev-appl-did-operator
  (restore unev)                  ; the operands
  (restore env)
  (assign argl (op empty-arglist))
  (assign proc (reg val))         ; the operator
  (test (op no-operands?) (reg unev))
  (branch (label apply-dispatch))
  (save proc)

;b
;Alyssa is not completely right.
;The parsing step is done only once by the compiler, whereas the interpreter needs to parse each expression every time is evaluated.
