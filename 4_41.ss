(define (list-of-n n)
  (if (= n 0)
      nil
      (cons n (list-of-n (- n 1)))))

;(list-of-n 5)
;(5 4 3 2 1)

(define (prepend n list-of-perms)
  (map (lambda (l) (cons n l))
       list-of-perms))

;(prepend 5 '((4 3 2 1) (3 2 1 4)))
;((5 4 3 2 1) (5 3 2 1 4))

(define (permutations n-list)
  (cond ((null? n-list) (list nil))
        ((null? (cdr n-list)) (list n-list))
        (else (use-first-elem n-list))))

(define (use-first-elem n-list)
  (define (helper done remaining)
    (if (null? remaining) 
        nil
        (append (prepend (car remaining) (permutations (append done (cdr remaining))))
                (helper (append done (list (car remaining))) (cdr remaining)))))
  (helper nil n-list))

;(permutations (list-of-n 3))
;((3 2 1) (3 1 2) (2 3 1) (2 1 3) (1 3 2) (1 2 3))

;also useful to non-numeric elements
;(permutations '((baker 1) (cooper 2) (fletcher 3)))
;(((baker 1) (cooper 2) (fletcher 3))
;((baker 1) (fletcher 3) (cooper 2))
;((cooper 2) (baker 1) (fletcher 3))
;((cooper 2) (fletcher 3) (baker 1))
;((fletcher 3) (baker 1) (cooper 2))
;((fletcher 3) (cooper 2) (baker 1)))

;element at index, starting at 1
(define (elem-at-index i alist)
  (define (helper count remaining)
    (cond ((null? remaining)
           (error "Array out of bounds -- ELEM-AT-INDEX"))
          ((= count 1) (car remaining))
          (else (helper (- count 1) (cdr remaining)))))
  (helper i alist))

;(elem-at-index 1 '(a b))
;a
;(elem-at-index 0 '(a b))
;Array out of bounds -- ELEM-AT-INDEX
;(elem-at-index 3 '(a b c))
;c
;(elem-at-index 3 '(a b))
;Array out of bounds -- ELEM-AT-INDEX

(define (baker-floor perm)
  (elem-at-index 1 perm))

(define (cooper-floor perm)
  (elem-at-index 2 perm))

(define (fletcher-floor perm)
  (elem-at-index 3 perm))

(define (miller-floor perm)
  (elem-at-index 4 perm))

(define (smith-floor perm)
  (elem-at-index 5 perm))

(define (print-labeled-solutions unlabeled-solutions)
  (for-each (lambda (perm)
              (newline)
              (display (list (list 'baker (baker-floor perm))
                             (list 'cooper (cooper-floor perm))
                             (list 'fletcher (fletcher-floor perm))
                             (list 'miller (miller-floor perm))
                             (list 'smith (smith-floor perm)))))
            unlabeled-solutions))

;filter from section 2.2.3
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (multiple-dwelling)
  (let* ((perms (permutations (list-of-n 5)))
         (unlabeled-solutions
          (filter (lambda (perm)
                    (and
                     (< (baker-floor perm) 5)
                     (> (cooper-floor perm) 1)
                     (< (fletcher-floor perm) 5)
                     (> (fletcher-floor perm) 1)
                     (> (miller-floor perm) (cooper-floor perm))
                     (not (= (abs (- (smith-floor perm) (fletcher-floor perm))) 1))
                     (not (= (abs (- (fletcher-floor perm) (cooper-floor perm))) 1))))
                  perms)))
    (print-labeled-solutions unlabeled-solutions)))

;(multiple-dwelling)
;((baker 3) (cooper 2) (fletcher 4) (miller 5) (smith 1))

