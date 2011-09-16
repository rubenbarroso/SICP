; without gcd-ing
(define (make-rat n d)
  (if (< d 0) 
      (cons (- n) (- d))
      (cons n d)))

; with gcd-ing
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat-gcd n d)
  (let ((g (gcd (abs n) (abs d))))
  (if (< d 0) 
      (cons (- (/ n g)) (- (/ d g)))
      (cons (/ n g) (/ d g)))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;(print-rat (make-rat-gcd -1 -2))
;1/2
;(print-rat (make-rat-gcd -2 -4))
;1/2
;(print-rat (make-rat-gcd -9 3))
;-3/1
;(print-rat (make-rat-gcd 9 -3))
;-3/1
