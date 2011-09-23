(define (stream-limit s t)
  (let ((first (stream-car s))
        (second (stream-car (stream-cdr s))))
    (if (< (abs (- second first)) t)
        second
        (stream-limit (stream-cdr s) t))))
