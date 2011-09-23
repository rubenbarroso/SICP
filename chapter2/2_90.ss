;we need to generify only adjoin-term and first-term
(define (install-sparse-termlists-package)
  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
        term-list
        (cons (coeff term) term-list)))
  
  (define (tag termlist) (attach-tag 'sparse-termlist termlist))
  
  (put 'first-term '(sparse-termlist)
       (lambda (t) (first-term t)))
  
  (put 'adjoin-term '(sparse-termlist)
       (lambda (t l) (adjoin-term t l)))
  'done)

(define (install-dense-termlists-package)
  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
        term-list
        (cons term term-list)))
  
  (define (first-term term-list)
    (make-term (- (length term-list) 1)
               (car term-list)))
  
  (put 'adjoin-term '(dense-termlist)
       (lambda (t l) (adjoin-term t l)))
  
  (put 'first-term '(dense-termlist)
       (lambda (t) (first-term t)))
  'done)

(define (adjoin-term term term-list)
  ((get 'adjoin-term (type-tag term-list)) term term-list))

;the rest of the operations already work for both representations
(define (first-term term-list) (car term-list))

(define (the-empty-termlist) '())

(define (rest-terms term-list) (cdr term-list))

(define (empty-termlist? term-list) (null? term-list))

(define (make-term order coeff) (list order coeff))

(define (order term) (car term))

(define (coeff term) (cadr term))