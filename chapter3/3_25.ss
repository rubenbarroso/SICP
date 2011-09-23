(define (make-table)
  (define (assoc key records)
    (cond ((null? records) false)
          ((equal? key (caar records)) (car records))
          (else (assoc key (cdr records)))))
  (let ((local-table (list '*table*)))
    (define (lookup keys)
      (let ((record (iter-lookup keys local-table)))
        (if record
            (cdr record)
            false)))
    (define (iter-lookup keys table)
      (if (null? keys) 
          false
          (let ((result (assoc (car keys) (cdr table))))
            (if (and result 
                     (null? (cdr keys)))
                result
                (iter-lookup (cdr keys) result)))))   
    (define (insert! keys value)
      ...
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))