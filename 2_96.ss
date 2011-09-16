;a
(define (pseudoremainder-terms p q)
  (cadr (div-terms (map
                    (lambda (t)
                      (make-term (order t) 
                                 (* (expt c (+ 1 (order (first-term p)) 
                                               (- order (first-term q)))) 
                                    (coeff t))))
                    p)
                   q)))

(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (pseudoremainder-terms a b))))


;b
(define (gcd-terms a b)
  (if (empty-termlist? b)
      (let ((gcd-coeff (gcd a)))
        (gcd-term-list gcd-coeff a))
      (gcd-terms b (remainder-terms a b))))

(define (gcd-term-list gcd-coeff termlist)
  (if (empty-termlist? termlist)
      nil
      (cons (make-term (order (first-term termlist))
                       (/ (coeff first-term termlist)
                          gcd-coeff))
            (gcd-term-list gcd-coeff (rest-terms termlist)))))
