;helpers

;files
(define (make-file division records)
  (list division records))

(define (division-of-file file)
  (car file))

(define (records-of-file file)
  (cadr file))

;records
(define (make-record key record)
  (cons key record))

(define (key record)
  (car record))

(define (extract-record record)
  (cdr record))

;a
(define (get-record given-key file)
  ((get 'get-record (division-of-file file)) given-key (records-of-file)))

;b
;we would need to add the salary to make-record
(define (get-salary record)
  ((get 'get-salary (division-of-record record)) (extract-record record)))

;c
;key instead of name
;TODO

;d
;it needs to implement the methods to extract the records from its own file format and install them using put