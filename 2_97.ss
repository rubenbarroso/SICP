;a
(define (reduce-terms n d)
  (let ((the-gcd (gcd n d)))
    (let ((int-fac (expt (first-term the-gcd) (+ 1 (max (order n) (order d)) (- (order (first-term the-gcd)))))))
      (let ((new-n (mul int-fac n))
            (new-d (mul int-fac d)))
        (let ((last-gcd (gcd-terms new-n new-d)))
          (list (div new-n last-gcd) (div new-d last-gcd)))))))

(define (reduce-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (let ((result (reduce-terms (term-list p1) (term-list p2))))
        (list (make-poly (variable p1) (car result))
              (make-poly (variable p2) (cadr result))))
      (error "Polys not in same var -- REDUCE-POLY" (list p1 p2))))

;b
(define (reduce n d) (apply-generic 'reduce n d))

;within the install-scheme-number-package
(define (reduce-integers n d)
  (let ((g (gcd n d)))
    (list (/ n g) (/ d g))))

(put 'reduce '(scheme-number scheme-number)
     (lambda (x y) (reduce-integers x y)))

(put 'reduce '(polynomial polynomial)
     (lambda (p1 p2) (reduce-integers p1 p2)))

(put 'reduce '(polynomial polynomial)
     (lambda (p1 p2)
       (let ((reduced (reduce-poly p1 p2)))
         (list (tag (car reduced)) (tag (cadr reduced))))))
