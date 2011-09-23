;Our compiler produces right-to-left evaluation of the operands of a combination. This is done in construct-arglist:

(define (construct-arglist operand-codes)
  (let ((operand-codes (reverse operand-codes))) ;right-to-left-evaluation
    (if (null? operand-codes)
        (make-instruction-sequence '() '(argl)
         '((assign argl (const ()))))
        (let ((code-to-get-last-arg
               (append-instruction-sequences
                (car operand-codes)
                (make-instruction-sequence '(val) '(argl)
                 '((assign argl (op list) (reg val)))))))
          (if (null? (cdr operand-codes))
              code-to-get-last-arg
              (preserving '(env)
               code-to-get-last-arg
               (code-to-get-rest-args
                (cdr operand-codes))))))))

(define (code-to-get-rest-args operand-codes)
  (let ((code-for-next-arg
         (preserving '(argl)
          (car operand-codes)
          (make-instruction-sequence '(val argl) '(argl)
           '((assign argl
              (op cons) (reg val) (reg argl)))))))
    (if (null? (cdr operand-codes))
        code-for-next-arg
        (preserving '(env)
         code-for-next-arg
         (code-to-get-rest-args (cdr operand-codes))))))

;If we wanted to apply left-to-right evaluation order:

;we use adjoin-arg (see footnote 22)

(define (construct-arglist operand-codes)
  (if (null? operand-codes)
      (make-instruction-sequence '() '(argl)
       '((assign argl (const ()))))
      (let ((code-to-get-first-arg
             (append-instruction-sequences
              (car operand-codes)
              (make-instruction-sequence '(val) '(argl)
               '((assign argl (op list) (reg val)))))))
        (if (null? (cdr operand-codes))
            code-to-get-first-arg
            (preserving '(env)
             code-to-get-first-arg
             (code-to-get-rest-args
              (cdr operand-codes)))))))

(define (code-to-get-rest-args operand-codes)
  (let ((code-for-next-arg
         (preserving '(argl)
          (car operand-codes)
          (make-instruction-sequence '(val argl) '(argl)
           '((assign argl
              (op adjoin-arg) (reg val) (reg argl)))))))
    (if (null? (cdr operand-codes))
        code-for-next-arg
        (preserving '(env)
         code-for-next-arg
         (code-to-get-rest-args (cdr operand-codes))))))

;this is less efficient because adjoin-arg performs an append of the current argl, which transform the evaluation of the arguments into O(n^2):

(define (adjoin-arg arg arglist)
  (append arglist (list arg)))

;instead of the O(n) that we had before by using cons.
