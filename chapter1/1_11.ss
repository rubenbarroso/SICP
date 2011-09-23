;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 1_11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
; f(n)=n if n<3
; f(n)=f(n-1)+2f(n-2)+3f(n-3) if n>=3

; recursive process - recursive procedure
(define (recur-f n)
  (if (< n 3)
      n
      (+ (recur-f (- n 1)) (* 2 (recur-f (- n 2))) (* 3 (recur-f (- n 3))))))

; iterative process - recursive procedure
(define (iter-f n)
  (i-f n 2 1 0))

; a <- a + 2b + 3c ; b <- a ; c <- b
(define (i-f n a b c)
  (if (= n 2) 
      a
      (i-f (- n 1) (+ a (* 2 b) (* 3 c)) a b)))
