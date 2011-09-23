(define count 0)

(define (id x)
  (set! count (+ count 1))
  x)

(define w (id (id 10)))

;;; L-Eval input:
count
;;; L-Eval value:
;1
;the outer call to id was not need, thus not forced, thus count was not incremented twice, only once

;;; L-Eval input:
w
;;; L-Eval value:
;10
;w forces the outer call to id, receiving 10

;;; L-Eval input:
count
;;; L-Eval value:
;2
;the previous call to w forced the evaluation of the outer call to id, hence incrementing count

