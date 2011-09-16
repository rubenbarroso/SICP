;we have an and-gate with inputs A,B and output C

;initial input values A=0, B=1, C=0

;FIFO
;A changes from 0 to 1. (propagate) uses this new value of A and the old of B (1), hence C is now 1
;B changes from 1 to 0. (propagate) uses this new value of B and the value of A (1), hence C is now 0
;The final result is 0

;LIFO
;B changes from 1 to 0. (propagate) uses this new value of B and the value of A (0), hence C is now 0
;A changes from 0 to 1. (propagate) uses this new value of A and the old of B (0), hence C is now 0
;The final result is 0

;we see that the intermediate values of the output are affected by the order in which the agenda segment
;procedures are executed
