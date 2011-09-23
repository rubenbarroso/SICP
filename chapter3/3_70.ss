(load "3_59.ss")

(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2))
               (weight-s1car (weight (stream-car s1)))
               (weight-s2car (weight (stream-car s2))))
           (cond ((<= weight-s1car weight-s2car)
                  (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight)))
                 (else
                  (cons-stream s2car (merge-weighted s1 (stream-cdr s2) weight))))))))

(define (weighted-pairs s t weight)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge-weighted
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
    weight)))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-for-each proc s n)
  (cond ((stream-null? s) (newline))
        ((= n 0) (newline))
        (else (begin (proc (stream-car s))
                     (stream-for-each proc (stream-cdr s) (- n 1))))))

(define (display-stream s n)
  (stream-for-each display-line s n))

(define (display-line x)
  (newline)
  (display x))

;a
(define (accumulated pair)
  (let ((i (car pair))
        (j (cadr pair)))
    (+ i j)))

(define accumulated-pairs
  (weighted-pairs integers integers accumulated))

;(display-stream accumulated-pairs 10)
;(1 1)
;(1 2)
;(1 3)
;(2 2)
;(1 4)
;(2 3)
;(1 5)
;(2 4)
;(3 3)
;(1 6)

;b
(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter pred
                                     (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))

(define (divisible? n)
  (or (= 0 (remainder n 2))
      (= 0 (remainder n 3))
      (= 0 (remainder n 5))))

(define (weight-non-divisible pair)
  (let ((i (car pair))
        (j (cadr pair)))
    (+ (* 2 i) (* 3 j) (* 5 i j))))

(define non-divisible
  (stream-filter (lambda (x) (not (divisible? x))) integers))

(define non-divisible-pairs
  (weighted-pairs non-divisible non-divisible weight-non-divisible))

;(display-stream non-divisible-pairs 10)
;(1 1)
;(1 7)
;(1 11)
;(1 13)
;(1 17)
;(1 19)
;(1 23)
;(1 29)
;(1 31)
;(7 7)
