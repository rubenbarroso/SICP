;within install-polynomial-package
(define (=zero-termlist? term-list)
  (cond ((empty-termlist? term-list) 
         true)
        ((not (=zero? (coeff (first-term term-list))))
         false)
        (else
         (=zero-termlist? (rest-terms term-list)))))

(put '=zero? '(polynomial)
     (lambda (p) (=zero-termlist? (term-list p))))

