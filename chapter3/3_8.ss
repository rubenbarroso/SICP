(define f
  (let ((value 1))
    (lambda (n)
      (if (= n 0)
          (begin
            (set! value n)
            value)
          value))))

;(f 0)
;0
;(f 1)
;0
;hence (+ (f 0) (f 1)) is 0 if arguments evaluated from left to right

;reinitialized the environment
;(f 1)
;1
;(f 0)
;0
;hence (+ (f 0) (f 1)) is 1 if arguments evaluated from right to left