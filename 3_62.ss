(load "3_61.ss")

(define (div-series s1 s2)
  (if (= (stream-car s2) 0)
      (error "Division by 0 - error")
      (mul-series s1
                  (invert-unit-series s2))))

(define tangent-series
  (div-series sine-series cosine-series))