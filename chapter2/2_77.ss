(put 'real-part '(complex) real-part)
(put 'imag-part '(complex) imag-part)
(put 'magnitude '(complex) magnitude)
(put 'angle '(complex) angle)

;this fills the operations table with these selector

(magnitude z) ;z is '(complex rectangular (3 4))
(apply-generic 'magnitude z)
(apply magnitude z') ;where z' is '(rectangular (3 4))
(magnitude z')
(apply-generic 'rectangular z')
(magnitude z'') ;where z'' is '(3 4)
(sqrt (+ (square 3) (square 4)))
5
