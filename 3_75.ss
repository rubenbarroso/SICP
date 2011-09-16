;Louis's code is averaging values from the output, which is not correct

(define (make-zero-crossings input-stream last-value last-avpt)
  (let ((avpt (/ (+ last-value (stream-car input-stream)) 2)))
    (cons-stream (sign-change-detector avpt last-avpt)
                 (make-zero-crossings (stream-cdr input-stream)
                                      (stream-car input-stream)
                                      avpt))))
