; a
(define (cont-frac n d k)
  (define (helper n d i)
    (if (= i k)
        0
        (/ (n i) (+ (d i) (helper n d (+ i 1))))))
  (helper n d 1))

; approximate 1/phi = 1/1.6180 = 0.6180
;(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 6)
;0.625
;(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 9)
;0.6176470588235294
;(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10)
;0.6181818181818182

; 10 steps to be accurate under 0.0001

; b
(define (iter-cont-frac n d k)
  (define (helper n d i sum)
    (if (= i 0)
    sum
    (helper n d (- i 1) (/ (n i) (+ (d i) sum)))))
  (helper n d k 0))

;(iter-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 6)
;0.6153846153846154
;(iter-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 9)
;0.6181818181818182
;(iter-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10)
;0.6179775280898876
