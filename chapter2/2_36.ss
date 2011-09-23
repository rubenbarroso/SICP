(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (car-n seqs)
  (if (null? seqs)
      nil
      (cons (car (car seqs))
            (car-n (cdr seqs)))))
 
;(car-n (list (list 2 3) (list 4 7)))
;(2 4)

;alternate version using map:
;(define (car-n sequence) 
;   (map car sequence)) 

(define (cdr-n seqs)
  (if (null? seqs)
      nil
      (cons (cdr (car seqs))
            (cdr-n (cdr seqs)))))

;(cdr-n (list (list 2 3) (list 4 7)))
;((3) (7))

;alternate version using map:
;(define (cdr-n sequence) 
;   (map cdr sequence)) 

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (car-n seqs))
            (accumulate-n op init (cdr-n seqs)))))

;(accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
;(22 26 30)             