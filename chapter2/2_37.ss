;helpers
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

;(matrix-*-vector (list (list 1 2) (list 3 4)) (list 2 3))
;(8 18)

(define (transpose mat)
  (accumulate-n cons nil mat))

;(transpose (list (list 1 2) (list 3 4)))
;((1 3) (2 4))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

;(matrix-*-matrix (list (list 1 2) (list 3 4)) (list (list 1 2) (list 3 4)))
;((7 10) (15 22))
