(define (equ? x y) (apply-generic 'equ? x y))

;inside install-scheme-number-package
(put 'equ? '(scheme-number scheme-number)
     (lambda (x y) (= x y)))

;inside install-rational-package
(put 'equ? '(rational rational)
     (lambda (x y) (and (= (numer x) (numer y))
                        (= (denom x) (denom y)))))

;inside install-complex-package
(put 'equ? '(complex complex)
     (lambda (x y) (and (= (real-part x) (real-part y))
                        (= (imag-part x) (imag-part y)))))
