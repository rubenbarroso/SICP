(load "3_55.ss")
(load "3_60.ss")

(define (ln2-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (ln2-summands (+ n 1)))))

(define ln2-stream
  (partial-sums (ln2-summands 1)))

(define (euler-transform s)
  (let ((s0 (stream-ref s 0))           ; S[n-1]
        (s1 (stream-ref s 1))           ; S[n]
        (s2 (stream-ref s 2)))          ; S[n+1]
    (cons-stream (- s2 (/ (square (- s2 s1))
                          (+ s0 (* -2 s1) s2)))
                 (euler-transform (stream-cdr s)))))

(define (square n) (* n n))

(define (make-tableau transform s)
  (cons-stream s
               (make-tableau transform
                             (transform s))))

(define (accelerated-sequence transform s)
  (stream-map stream-car
              (make-tableau transform s)))

(define acc-ln2 (accelerated-sequence euler-transform
                                      ln2-stream))

;(stream-ref acc-ln2 0)
;1.0
;(stream-ref acc-ln2 1)
;0.7
;(stream-ref acc-ln2 2)
;0.6932773109243697
;(stream-ref acc-ln2 3)
;0.6931488693329254
;(stream-ref acc-ln2 4)
;0.6931471960735491
;(stream-ref acc-ln2 5)
;0.6931471806635636
