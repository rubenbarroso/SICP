(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

;a
(define simple-tree (make-tree 3 (make-tree 1 nil (make-tree 2 nil nil)) (make-tree 4 nil (make-tree 5 nil nil))))

;(tree->list-1 simple-tree)
;(1 2 3 4 5)
;(tree->list-2 simple-tree)
;(1 2 3 4 5)
;they both produce the same as they perform a depth-first copy

;list for first tree
(define tree1
  (make-tree 7
             (make-tree 3
                        (make-tree 1 nil nil)
                        (make-tree 5 nil nil))
             (make-tree 9
                        nil
                        (make-tree 11 nil nil))))
;(tree->list-1 tree1)
;(1 3 5 7 9 11)
;(tree->list-2 tree1)
;(1 3 5 7 9 11)

;list for second tree
(define tree2
  (make-tree 3
             (make-tree 1 nil nil)
             (make-tree 7
                        (make-tree 5 nil nil)
                        (make-tree 9
                                   nil
                                   (make-tree 11 nil nil)))))
;(tree->list-1 tree2)
;(1 3 5 7 9 11)
;(tree->list-2 tree2)
;(1 3 5 7 9 11)

;list for third tree
(define tree3
  (make-tree 5
             (make-tree 3
                        (make-tree 1 nil nil)
                        nil)
             (make-tree 9
                        (make-tree 7 nil nil)
                        (make-tree 11 nil nil))))
;(tree->list-1 tree3)
;(1 3 5 7 9 11)
;(tree->list-2 tree3)
;(1 3 5 7 9 11)

;b
;tree->list-1 is O(n·log n)
;tree->list-2 is O(n)

