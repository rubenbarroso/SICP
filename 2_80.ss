(define (=zero? x y) (apply-generic '=zero? x y))

;inside install-scheme-number-package
(put '=zero? '(scheme-number)
     (lambda (x) (= x 0)))

;inside install-rational-package
(put '=zero? '(rational)
     (lambda (x) (= (numer x) 0)))

;inside install-complex-package
(put '=zero? '(complex)
     (lambda (x) (= (magnitude x) 0)))
