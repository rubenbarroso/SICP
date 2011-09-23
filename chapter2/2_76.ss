;let's take the exampe of the complex numbers representation

;generic operations with explicit dispatch
;new type:
;  1) create a predicate for the new type
;  2) add to each selector a cond clause querying for the new type
;new operation:
;  1) add to every representation the new operation procedure

;data-directed style
;new type:
;  1) create a new column on the table of operations for the new type
;new operation
;  1) create a new line on the table with implementations for every type

;message-passing style
;new type:
;  1) create the constructor of the new type that returns the corresponding dipatch method
;new operation:
;  1) for every type, we need to add a new cond clause asking for the new operation

; for adding new types, the best organization is message-directed or data-directed style
; for adding new operations, every one of them is suitable