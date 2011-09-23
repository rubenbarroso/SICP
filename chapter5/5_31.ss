;(f 'x 'y)
; env doesn't need to be saved/restored around the operator evauation, since it's a symbol f in the environment
; env not saved/restored around each operand evaluation, since they're symbols in the environment
; argl not saved/restored around each operand evaluation, since they are not procedure applications themselves
; proc not saved/restored around the the evaluation of the operand sequence, because any of the operands is a procedure application itself

;((f) 'x 'y)
; no need to save anything since env is not changed around the evaluation of the operator, and the operands are symbols

;(f (g 'x) y)
; env saved/restored around evaluation of (g 'x) and y
; proc saved/restored around the evaluation of the operand sequence, because (g 'x) operand is an application itself

;(f (g 'x) 'y)
; same as previous one
