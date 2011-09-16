(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (make-record key record)
  (cons key record))

(define (key record)
  (car record))

(define (extract-record record)
  (cdr record))

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

(define (lookup given-key set-of-records)
  (let ((current-key (key (entry set-of-records))))
    (cond ((null? set-of-records) false)
          ((= given-key current-key) 
           (extract-record (entry set-of-records)))
          ((< given-key current-key)
           (lookup given-key (left-branch set-of-records)))
          ((> given-key current-key)
           (lookup given-key (right-branch set-of-records))))))

(define record1 (make-record 1 'a))
(define record2 (make-record 2 'b))
(define record3 (make-record 3 'c))
(define record4 (make-record 4 'd))
(define record5 (make-record 5 'e))
(define record6 (make-record 6 'f))
(define record7 (make-record 7 'g))
(define record8 (make-record 8 'h))
(define record9 (make-record 9 'i))

(define myrecords (list record1 record2 record3 record4 record5 record6 record7 record8 record9))

;(list->tree myrecords)
;((5 . e) ((2 . b) ((1 . a) () ()) ((3 . c) () ((4 . d) () ()))) ((7 . g) ((6 . f) () ()) ((8 . h) () ((9 . i) () ()))))

;(lookup 4 (list->tree myrecords))
;d
