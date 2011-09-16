;a or b is equal to ~(~a and ~b) by DeMorgan

(define (or-gate a1 a2 output)
  (let ((b (make wire))
        (c (make-wire))
        (d (make-wire)))
    (inverter a1 b)
    (inverter a2 c)
    (and-gate b c d)
    (inverter d output))
  'ok)

;the delay time is d(or)=2*d(inv)+d(and)


