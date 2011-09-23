;(car (cdr (car (cdr (cdr (list 1 3 (list 5 7) 9))))))
;7

;(car (car (list (list 7))))
;7

(define items (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
;items
;(1 (2 (3 (4 (5 (6 7))))))
;(cdr items)
;((2 (3 (4 (5 (6 7))))))
;(cdr (cdr items))
;()
;(car (cdr items))
;(2 (3 (4 (5 (6 7)))))
;(car (cdr (car (cdr items))))
;(3 (4 (5 (6 7))))
;(car (cdr (car (cdr (car (cdr items))))))
;(4 (5 (6 7)))
;(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr items))))))))))
;(6 7)
;(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr items))))))))))))
;7
