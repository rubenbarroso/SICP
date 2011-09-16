(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

;a
;partial-tree works by dividing the first n elements into two sublists of n/2 length.
;it performs recursive calls over those two sublists and creates a tree using the pivot
;and the result trees calculated by those recursive calls.

;(list->tree (list 1 3 5 7 9 11))
;(5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
;
;    5
;  /   \
; /     \
;1       9
; \     / \
;  \   /   \
;   3 7     11

;b
;list->tree is O(n) as every element in the tree is visited only once and just cons is applied at every step
