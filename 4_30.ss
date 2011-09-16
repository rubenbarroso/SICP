;a
(define (eval-sequence exps env)
  (cond ((last-exp? exps) (eval (first-exp exps) env))
        (else (actual-value (first-exp exps) env)
              (eval-sequence (rest-exps exps) env))))

(define (for-each proc items)
  (if (null? items)
      'done
      (begin (proc (car items))
             (for-each proc (cdr items)))))

;;; L-Eval input:
(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))
57
321
88
;;; L-Eval value:
done


;Ben is right because display is a primitive elements

;b
(define (p1 x)
  (set! x (cons x '(2)))
  x)


(define (p2 x)
  (define (p e)
    e
    x)
  (p (set! x (cons x '(2)))))

;with the original eval-sequence:
;(p1 1) is evaluated to (1 2)
;(p2 1) is evaluated to 1 (since set! is not forced in the evaluation of the sequence -not passed to a primitive procedure)

;with Cy's eval-sequence:
;(p1 1) is evaluated to (1 2)
;(p2 1) is evaluated to (1 2)

;c
;display is a primitive argument and the calls to it forces its argument, hence the behavior has not changed

;d
;Ideally, the user ought to be able to select the mode in which the sequences are treated. By default, I would use the text's version because
;Cy's version veers from the original intent of lazy evaluation.
