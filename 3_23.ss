;using double-linked lists due to the O(1) restriction
(define (make-deque) (cons nil nil))

(define (front-deque deque)
  (if (empty-deque? deque)
      (error "FRONT called with an empty deque" deque)
      (caar (front-ptr deque))))

(define (rear-deque deque)
  (if (empty-deque? deque)
      (error "REAR called with an empty deque" deque)
      (caar (rear-ptr deque))))

(define (empty-deque? deque) (null? (front-ptr deque)))

(define (front-ptr deque) (car deque))

(define (rear-ptr deque) (cdr deque))

(define (set-front-ptr! deque item) (set-car! deque item))

(define (set-rear-ptr! deque item) (set-cdr! deque item))

(define (front-insert-deque! deque item)
  (let ((new-trie (cons (cons item nil) nil)))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-trie)
           (set-rear-ptr! deque new-trie)
           deque)
          (else
           (set-cdr! new-trie (front-ptr deque))
           (set-cdr! (car (front-ptr deque)) new-trie)
           (set-front-ptr! deque new-trie)
           deque)))) 

(define (rear-insert-deque! deque item)
  (let ((new-trie (cons (cons item nil) nil)))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-trie)
           (set-rear-ptr! deque new-trie)
           deque)
          (else
           (set-cdr! (rear-ptr deque) new-trie)
           (set-cdr! (car new-trie) (rear-ptr deque))
           (set-rear-ptr! deque new-trie)
           deque)))) 

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "FRONT-DELETE! called with an empty deque" deque))
        (else
         (set-front-ptr! deque (cdr (front-ptr deque)))
         (set-cdr! (car (front-ptr deque)) nil)
         deque))) 

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "REAR-DELETE! called with an empty deque" deque))
        (else
         (set-rear-ptr! deque (cdar (rear-ptr deque)))
         (set-cdr! (rear-ptr deque) nil)
         deque))) 