;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader{lib "htdp-advanced-reader.ss" "lang"}{{modname 1_17} {read-case-sensitive #t} {teachpacks ()} {htdp-settings #(#t constructor repeating-decimal #t #t none #f ())}}
; this is actually 1.18
(define (f a b)
  (iter-mult a b 0))

(define (iter-mult a b c)
  (cond ((= b 0) c)
        ((even? b) (iter-mult (double a) (halve b) c))
        (else (iter-mult a (- b 1) (+ a c)))))

(define (double n) (* n 2))

(define (halve n) (/ n 2))
