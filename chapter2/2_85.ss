(define (project x) (apply-generic 'project x))

;to be included in the complex package
(define (project-complex x)
  (make-from-real-imag (real-part x) 0))

(put 'project '(complex)
     (lambda (x) (make-real (real-part x))))

;to be included in the real package
(put 'project '(real)
     (lambda (x)
       (let ((rational
              (rationalize
               (inexact->exact x) 1/100)))
         (make-rational
          (numerator rational)
          (denominator rational)))))

;to be included in the rational package
(define (project-rational x)
  (round (/ (numer x) (denom x))))

(put 'project '(rational)
     (lambda (x) (project-rational x)))

(define (drop x)
  (let ((project-proc (get 'project (list (type-tag x)))))
    (if project-proc
        (if (equ? x (raise (project-proc x)))
            (drop (project-proc x))
            x)
        x)))

;apply-generic reloaded
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (drop (apply proc (map contents args)))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (let ((type1-level (level-of type1))
                      (type2-level (level-of type2)))
                  (cond ((>= type-level2 type-level1)
                         (apply-generic op (coerce a1 type2) a2))
                        (else (apply-generic op a1 (coerce a2 type1))))))
              (error "No method for these types"
                     (list op type-tags)))))))

