;we need to maintain the abstraction provided by the sparse implementation
(define (adjoin-term term term-list)
  (if (=zero? (coeff term))
      term-list
      (cons (coeff term) term-list)))

(define (first-term term-list)
  (make-term (- (length term-list) 1)
             (car term-list)))

;the rest of the procedures - untouched
(define (the-empty-termlist) nil)

(define (rest-terms term-list) (cdr term-list))

(define (empty-termlist? term-list) (null? term-list))

(define (make-term order coeff) (list order coeff))

(define (order term) (car term))

(define (coeff term) (cadr term))

