(load "text/ch4-ambeval.scm")

(define the-global-environment (setup-environment))

;paste the following after doing (driver-loop)
(define (require p)
  (if (not p) (amb)))

(define (make-pos col row)
  (list col row))

(define (pos-col pos)
  (car pos))

(define (pos-row pos)
  (cadr pos))

(define (queen-safe? queen1-pos queen2-pos)
  (let ((offset (abs (- (pos-col queen2-pos) (pos-col queen1-pos)))))
    (cond ((= (pos-row queen1-pos) (pos-row queen2-pos))
           false)
          ((= (+ (pos-row queen1-pos) offset) (pos-row queen2-pos))
           false)
          ((= (- (pos-row queen1-pos) offset) (pos-row queen2-pos))
           false)
          (else true))))

;(queen-safe? '(1 1) '(2 3))
;#t
;(queen-safe? '(1 1) '(2 4))
;#f
;(queen-safe? '(1 1) '(2 2))
;#f
;(queen-safe? '(1 1) '(8 8))
;#f
;(queen-safe? '(1 1) '(3 1))
;#f
;(queen-safe? '(1 1) '(3 2))
;#t

(define (first-safe? positions)
  (define (helper first-pos rest-positions)
    (cond ((null? rest-positions) true)
          ((not (queen-safe? first-pos (car rest-positions))) false)
          (else (helper first-pos (cdr rest-positions)))))
  (helper (car positions) (cdr positions)))

;(first-safe? '((1 1) (2 2) (3 3) (4 4) (5 5)))
;#f

(define (safe? positions-cols)
  (let ((the-positions (positions-from-cols positions-cols)))
    (cond ((null? positions-cols) true)
          ((not (first-safe? the-positions)) false)
          (else (safe? (cdr positions-cols))))))

;(safe? '(1 2 3))
;#f

(define (positions-from-cols positions-cols)
  (define (helper i rest-positions-cols)
    (if (null? rest-positions-cols)
        '()
        (cons (make-pos i (car rest-positions-cols))
              (helper (+ i 1) (cdr rest-positions-cols)))))
  (helper 1 positions-cols))

;(positions-from-cols '(1 2 3 4 5))
;((1 1) (2 2) (3 3) (4 4) (5 5))

(define (8-queens)
  (let ((row-1-col (amb 1 2 3 4 5 6 7 8))
        (row-2-col (amb 1 2 3 4 5 6 7 8)))
    (require (safe? (list row-1-col row-2-col)))
    (let ((row-3-col (amb 1 2 3 4 5 6 7 8)))
      (require (safe? (list row-1-col row-2-col row-3-col)))
      (let ((row-4-col (amb 1 2 3 4 5 6 7 8)))
        (require (safe? (list row-1-col row-2-col row-3-col row-4-col)))
        (let ((row-5-col (amb 1 2 3 4 5 6 7 8)))
          (require (safe? (list row-1-col row-2-col row-3-col row-4-col row-5-col)))
          (let ((row-6-col (amb 1 2 3 4 5 6 7 8)))
            (require (safe? (list row-1-col row-2-col row-3-col row-4-col row-5-col row-6-col)))
            (let ((row-7-col (amb 1 2 3 4 5 6 7 8)))
              (require (safe? (list row-1-col row-2-col row-3-col row-4-col row-5-col row-6-col row-7-col)))
              (let ((row-8-col (amb 1 2 3 4 5 6 7 8)))
                (let ((the-final-placement (list row-1-col row-2-col row-3-col row-4-col row-5-col row-6-col row-7-col row-8-col)))
                  (require (safe? the-final-placement))
                  the-final-placement)))))))))

(8-queens)

;;;; Starting a new problem 
;;; Amb-Eval value:
;ok

;;; Amb-Eval input:

;;; Starting a new problem 
;;; Amb-Eval value:
;(1 5 8 6 3 7 2 4)

;;; Amb-Eval input:
;try-again

;;; Amb-Eval value:
;(1 6 8 3 7 4 2 5)

;...
;92 solutions, see http://en.wikipedia.org/wiki/Eight_queens_puzzle
