(define (tan-cf x k)
  (define (cont-frac n d)
    (define (helper n d i)
      (if (= i k)
          0
          (/ (n i) (+ (d i) (helper n d (+ i 1))))))
    (helper n d 1))
  (cont-frac (lambda (i) (if (= i 1) x (- (* x x))))
             (lambda (i) (if (= i 1) 1 (- (* 2 i) 1)))))

(define pi 3.14159265)

;(tan-cf 0 10)
;0
;(tan (/ pi 4))
;0.9999999982051035