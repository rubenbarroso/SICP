;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 1_16) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define (iter-exp n a b)
  (cond ((= n 0) a)
        ((even? n) (iter-exp (/ n 2) a (square b)))
        (else (iter-exp (- n 1) (* a b) b))))

(define (square x) (* x x))
