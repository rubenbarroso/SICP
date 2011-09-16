;within install-polynomial-package
(define (negate-termlist term-list)
  (if (empty-termlist? term-list)
      term-list
      (adjoin-term (make-term (first-term term-list) 
                              (- (first-term term-list)))
                   (negate-termlist (rest-terms term-list)))))

(put 'neg '(polynomial)
     (lambda (p) (make-poly (variable p) (negate-termlist (term-list p)))))

(define (neg x) (apply-generic 'neg x))

(define (sub-poly p1 p2)
  (add p1 (neg p2)))

(put 'sub '(polynomial polynomial)
     (lambda (p1 p2) (tag (sub-poly p1 p2))))
