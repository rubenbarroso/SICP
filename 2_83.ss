(define (raise-integer x)
  (make-rat x 1))

(define (raise-rational x)
  (make-real (/ (numer x) (denom x))))

(define (raise-real x)
  (make-from-real-imag x 0))

(define (raise-complex x)
  (error "A complex number cannot be raised" x))

;install-packages
(put 'raise '(integer)
     (lambda (x) (tag (raise-integer x))))

(put 'raise '(rational)
     (lambda (x) (tag (raise-rational x))))

(put 'raise '(real)
     (lambda (x) (tag (raise-real x))))

;we could also omit the put so the operation is not found
(put 'raise '(complex)
     (lambda (x) (tag (raise-complex x))))

;lastly - generic operation
(define (raise x) (apply-generic 'raise x))

