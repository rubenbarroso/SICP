(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;a
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;b
(define (branch-weight branch)
  (if (not (pair? (branch-structure branch)))
      (branch-structure branch)
      (total-weight (branch-structure branch))))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define m1 (make-mobile (make-branch 3 4)
                        (make-branch 4 (make-mobile (make-branch 2 3)
                                                    (make-branch 4 8)))))

;(total-weight m1)
;15

;c
(define (torque branch)
  (* (branch-length branch) 
     (branch-weight branch)))

(define (balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (= (torque left) (torque right))
         (if (pair? (branch-structure left)) 
             (balanced? left) 
             #t)
         (if (pair? (branch-structure right)) 
             (balanced? right) 
             #t))))

(define m2
  (make-mobile (make-branch 2 4)
               (make-branch 3
                            (make-mobile (make-branch 2 1)
                                         (make-branch 4 2)))))

;(torque (left-branch m2))
;8
;(torque (right-branch m2))
;9
;(balanced? m2)
;#f

(define m3
  (make-mobile (make-branch 2 4)
               (make-branch 8 1)))

;(balanced? m3)
;#t

;d
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

;we would only need change the following selectors (abstraction barrier)
;the selectors layer is the only aware of the representation of mobiles
;and branches
(define (right-branch mobile)
  (cdr mobile))

(define (branch-structure mobile)
  (cdr mobile))
