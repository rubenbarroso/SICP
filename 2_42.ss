(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (flatmap proc seq)
  (fold-right append nil (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

;exercise
;(2 4 1 3) represents layout (row col) -> ((2 1) (4 2) (1 3) (4 3))

(define empty-board nil)

(define (adjoin-position new-row column rest-of-queens)
  (cons new-row rest-of-queens))

;(adjoin-position 3 5 (list 2 4 1 3))
;(2 4 1 3 3)

;not used
(define (row-of column position)
  (if (= column 1)
      (car position)
      (row-of (- column 1) (cdr position))))

;(row-of 3 (list 2 4 1 3))
;1
;(row-of 1 (list 2 4 1 3))
;2
 
;solution taken from the SICP wiki
(define (safe? column positions)
  (define (next-column-safe? new-row positions row-offset)
    (if (null? positions)
        true
        (let ((this-row (car positions)))
          (if (or (= this-row new-row)
                  (= (+ this-row row-offset) new-row)
                  (= (- this-row row-offset) new-row))
              false
              (next-column-safe? new-row (cdr positions) (+ 1 row-offset))))))
  (next-column-safe? (car positions) (cdr positions) 1))

;(queens 4)
;((3 1 4 2) (2 4 1 3))
