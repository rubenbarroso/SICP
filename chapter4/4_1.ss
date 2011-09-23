;left->right
(define (list-of-values exps env)
  (if (no-operands? exps)
      nil
      (let ((first (eval (first-operand exps) env)))
        (cons first
              (list-of-values (rest-operands exps) env)))))

;right->left
(define (list-of-values exps env)
  (if (no-operands? exps)
      nil
      (let ((rest (list-of-values (rest-operands exps) env)))
        (cons (eval (first-operand exps) env)
              rest))))
