;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader{lib "htdp-advanced-reader.ss" "lang"}{{modname 1_12} {read-case-sensitive #t} {teachpacks ()} {htdp-settings #(#t constructor repeating-decimal #t #t none #f ())}}
; Pascal's Triangle - tabular representation of the Binomial recursion
; C(n, k) = C(n-1, k-1) + C(n-1, k)
(define (c n k)
  (cond ((= k 0) 1)
        ((= n k) 1)
        (else (+ (c (- n 1) (- k 1)) 
                 (c (- n 1) k)))))
