;in the new form

(lambda (f y0 dt)
  (let ((y '*unassigned*)
        (dy '*unassigned*))
    (let ((a (integral (delay dy) y0 dt))
          (b (stream-map f y)))
      (set! y a)
      (set! dy b))
    y))

;equivalent to

(lambda (f y0 dt)
  (let ((y '*unassigned*)
        (dy '*unassigned*))
    ((lambda (a b) (set! y a) (set! dy b))
     (integral (delay dy) y0 dt)
     (stream-map f y))
    y))

;this does not work because in the inner let, b is assigned the result of evaluating (stream-map f y), which uses "unassigned" y.

;in the original form

(lambda (f y0 dt)
  (let ((y '*unassigned*)
        (dy '*unassigned*))
    (set! y (integral (delay dy) y0 dt))
    (set! dy (stream-map f y))
    y))

;here we don't have the same problem. At the time dy is evaluated, it has access to y, which is already evaluated.
