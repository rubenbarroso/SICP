; (for <var> <initial-value> <final-value> <body>)
;expanded to:
(let for-iter ((<var> <initial-value>)
               (count <final-value>))
  (if (= <var> count)
      'done
      (begin
        <body>
        (for-iter (+ <var> 1) count))))

; example: (for 0 10 (display i))

(define (for->combination exp)
  (make-named-let 'for-iter
                  (cons (list (for-var exp) (for-initial exp))
                        (list 'count (for-final exp)))
                  (make-if (list '= (for-var exp) 'count)
                           'done
                           (sequence->exp (cons for-body
                                                (list 'for-iter (list '+ (for-var exp) 1) 'count))))))
