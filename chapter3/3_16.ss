(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define r3 '(a b c))

;r3
;(a b c)
;(count-pairs r3)
;3

(define r4 (list 'a 'b (cons 'c 'c)))

;r4
;(a b (c . c))
;(count-pairs r4)
;4

(define p1 (cons 'a 'b))

(define p2 (cons p1 p1))

(define r7 (cons p2 p2))

;r7
;(((a . b) a . b) (a . b) a . b)
;(count-pairs r7)
;7

; non returning
(define p (cons (cons '1 '2) (cons '3 '4)))
(set-cdr! (cdr p) p)

;(count-pairs p)
