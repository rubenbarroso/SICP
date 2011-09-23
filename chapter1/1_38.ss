(define (cont-frac n d k)
  (define (helper n d i)
    (if (= i k)
        0
        (/ (n i) (+ (d i) (helper n d (+ i 1))))))
  (helper n d 1))

(define (aprox-e k)
  (+ 2 (cont-frac (lambda (i) 1.0)
                  (lambda (i) (if (= (remainder i 3) 2)
                                  (- i (quotient i 3))
                                  1.0))
                  k)))

;(aprox-e 10.0)
;2.718283582089552

