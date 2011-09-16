(define (ripple-carry-adder an bn sn c)
  (define (helper ak bk sk ck c)
    (cond ((null? ak) 'ok)
          (else
           (let ((c-out (if (null? (cdr ak))
                            c
                            (make-wire))))
             (full-adder (car ak) (car bk) ck (car sk) c-out)
             (helper (cdr ak) (cdr bk) (cdr sk) c-out c)))))
  (helper an bn sn 0 c))

;the delay of a half-adder is d(h-add)=2*d(and)+d(or)+d(inv)
;the delay for a full-adder is d(f-add)=2*d(h-add)+d(or)
;the delay for a ripple-carry-adder is d(rc-add)=n*(2*d(h-add)+d(or))=n*(2*(2*d(and)+d(or)+d(inv))+d(or))=n*(4*d(and)+2*d(or)+2*d(inv)+d(or))
;=4n*d(and)+3n*d(or)+2n*d(inv)


