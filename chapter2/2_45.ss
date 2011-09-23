(define (split outer inner)
  (define (split-helper painter n)
    (if (= n 0)
        painter
        (let ((smaller (split-helper painter (- n 1))))
          (outer painter (inner smaller smaller)))))
  split-helper)

(define right-split (split beside below))

(define up-split (split below beside))
