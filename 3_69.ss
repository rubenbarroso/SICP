(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    (stream-map (lambda (x) (append (list (stream-car s)) x))
                (stream-cdr (pairs t u)))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define pythagorean
  (stream-filter
   (lambda (x)
     (= (+ (square (car x)) (square (cadr x)))
        (square (caddr x))))
   (triples integer integer integer)))
