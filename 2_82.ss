(define (apply-generic op . args)
  (define (apply-generic-helper op args types)
    (if (null? types)
        (error "No method for these types"
               (list op (map type-tag args)))
        (let ((new-args (map (lambda (x)
                               (coerce x (car types)))
                             args)))
          (let ((new-types (map type-tag new-args)))
            (let ((proc (get op new-types)))
              (if proc
                  (apply proc (map contents new-args))
                  (apply-generic-helper op args (cdr types))))))))
  (let ((types (map type-tag args)))
    (let ((proc (get op types)))
      (if proc
          (apply proc (map contents args))
          (apply-generic-helper op args types)))))

(define (coerce x type)
  (let ((current-type->type (get-coercion (type-tag x) type)))
    (if current-type->type
        (current-type->type x)
        x)))
