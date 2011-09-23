(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (tree->list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

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

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((< (car set1) (car set2)) 
         (cons (car set1) (union-set (cdr set1) set2)))
        ((> (car set1) (car set2))
         (cons (car set2) (union-set set1 (cdr set2))))
        ((= (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) (cdr set2))))))

(define (union-set-trees tree1 tree2)
  (list->tree (union-set (tree->list tree1) 
                         (tree->list tree2))))

(define sample-tree1 (list->tree (list 1 3 5 7 9 11)))

(define sample-tree2 (list->tree (list 2 4 6 8 10)))

;(tree->list (union-set-trees sample-tree1 sample-tree2))
;(1 2 3 4 5 6 7 8 9 10 11)

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()    
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))

(define (intersection-set-trees tree1 tree2)
  (list->tree (intersection-set (tree->list tree1)
                                (tree->list tree2))))

;(tree->list (intersection-set-trees sample-tree1 sample-tree2))
;()

(define sample-tree3 (list->tree (list 1 5 9 12 15)))

;(tree->list (intersection-set-trees sample-tree1 sample-tree3))
;(1 5 9)
;(tree->list (union-set-trees sample-tree1 sample-tree3))
;(1 3 5 7 9 11 12 15)
