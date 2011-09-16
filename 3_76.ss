(load "3_70.ss")

(define (smooth input-stream)
  (let ((avpt (/ (+ (stream-car input-stream) 
                    (stream-car (stream-cdr input-stream))) 
                 2)))
    (cons-stream avpt
                 (smooth (stream-cdr input-stream)))))

(define input-example (cons-stream 1 (cons-stream 2 (cons-stream 3 (cons-stream 4 nil)))))

(define (make-zero-crossings input-stream last-value smooth)
  (smooth (cons-stream last-value input-stream)))
