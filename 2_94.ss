(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))))

(define (remainder-terms a b)
  (cadr (div-terms a b)))

(define (gcd-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (gcd-terms (term-list p1)
                            (term-list p2)))
      (error "Polys not in same var -- GCD-POLY" (list p1 p2))))

(define (greatest-common-divisor x y)
  (apply-generic 'greatest-common-divisor x y))

;within the install-polynomial-package
(put 'greatest-common-divisor '(polynomial polynomial)
     (lambda (p1 p2) (tag (gcd-poly p1 p2))))

;within the install-scheme-number-package
(put 'greatest-common-divisor '(scheme-number scheme-number)
     (lambda (x y) (tag (gcd x y))))
