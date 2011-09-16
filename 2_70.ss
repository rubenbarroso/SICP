;helpers
(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaves)
  (cond ((null? leaves) nil)
        ((null? (cdr leaves)) (car leaves)) ;one element left
        (else (successive-merge (cons (make-code-tree (cadr leaves)
                                                      (car leaves))
                                      (cddr leaves))))))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (encode message tree)
  (if (null? message)
      nil
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-symbol-helper symbol tree encoding)
    (cond ((leaf? tree) encoding)
          ((element-of-set? symbol (symbols (left-branch tree)))
           (encode-symbol-helper symbol (left-branch tree) (append encoding '(0))))
          ((element-of-set? symbol (symbols (right-branch tree)))
           (encode-symbol-helper symbol (right-branch tree) (append encoding '(1))))
          (else (error "symbol not in the tree" symbol))))
  (encode-symbol-helper symbol tree nil))

;exercise
(define alphabet '((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1)))

;(make-leaf-set alphabet)
;((leaf WAH 1) (leaf BOOM 1) (leaf JOB 2) (leaf GET 2) (leaf A 2) (leaf SHA 3) (leaf YIP 9) (leaf NA 16))

;(encode '(GET) (generate-huffman-tree alphabet))
;(1 1 1 1 0)

(define stanza '(GET A JOB SHA NA NA NA NA NA NA NA NA ))

(define ending '(WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM))

(define message (append (append stanza stanza) ending))

;message
;(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM)
;(encode message (generate-huffman-tree alphabet))
;(1 1 1 1 0 1 1 1 0 1 1 1 1 1 0 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 0 1 1 1 0 1 1 1 1 1 0 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 0 1 1 1 1 1 1 0)

;check it's correct
;(decode '(1 1 1 1 0 1 1 1 0 1 1 1 1 1 0 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 0 1 1 1 0 1 1 1 1 1 0 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 0 1 1 1 1 1 1 0) (generate-huffman-tree alphabet))
;(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM)

;87 bits required for the encoding
;for a fixed length code: 36 symbols x log2(8) bits/symbol = 108 bits
;space savings -> (* (/ (- 108 87) 108) 100) = 19.4%
