;The value of a will be 3, because the labels are stored in program order and
;the assoc in the lookup-label procedure will return the first here.

(define (extract-labels text receive)
  (if (null? text)
      (receive '() '())
      (extract-labels (cdr text)
                      (lambda (insts labels)
                        (let ((next-inst (car text)))
                          (cond ((and (symbol? next-int) (assoc next-inst labels))
                                 (error "Already defined label -- EXTRACT-LABELS" next-int))
                                ((symbol? next-inst)
                                 (receive insts
                                          (cons (make-label-entry next-inst
                                                                  insts)
                                                labels)))
                                (else
                                 (receive (cons (make-instruction next-inst)
                                                insts)
                                          labels))))))))
