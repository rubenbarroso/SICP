;fibonacci calculation runs way more faster with memoization

(define (square x) (* x x))

;with memoization

;;; L-Eval input:
(square (id 10))
;;; L-Eval value:
100

;;; L-Eval input:
count
;;; L-Eval value:
1

;without memoization

;;; L-Eval input:
(square (id 10))
;;; L-Eval value:
100

;;; L-Eval input:
count
;;; L-Eval value:
2
