(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

;(map (lambda (x) (* x 2)) (list 1 2 3 4 5))
;(2 4 6 8 10)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

;(append (list 1 2) (list 3 4))
;(1 2 3 4)

(define (length sequence) ; weird, but it works :)
  (accumulate (lambda (x y) (+ (/ x x) y)) 0 sequence))

;other solution from the Internet
(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y))
              0
              sequence))

;(length (list 1 2 3 4 5))
;5