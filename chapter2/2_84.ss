(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
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

;every type has a level associated, and all types are stored in a list
(define global-types '(integer rational real complex))

(define (level-of type)
  (define (helper types level)
    (cond ((null? types) (error "Type not found -- LEVEL-OF" type))
          ((eq? type (car types)) level)
          (else (helper (cdr types) (+ level 1)))))
  (helper global-types 0))

;(level-of 'carmichael)
;Type not found -- LEVEL-OF carmichael
;(level-of 'integer)
;0
;(level-of 'complex)
;3

;pre: (<= (level-of (type-tag x)) target-type) is true
(define (coerce x target-type)
  (if (> (level-of target-type) (level-of (type-tag x)))
      (coerce-x (raise x) target-type)
      ((get-coercion (type-tag x) target-type) x)))

