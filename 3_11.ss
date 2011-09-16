(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch)

; (define acc (make-account 50))
; in the global env, a procedure object bound to make-account is created, whose environment is the global env and show body is (define ...) (the internal definitions)
; another binding 'acc' in the global env, pointing at E1, that contains balance:50, withdraw, deposit and dispatch.

; ((acc 'deposit) 40)
; a new env E2 is created, pointing at E1 (where acc was defined), with m bound to 'deposit. Same for ((acc 'withdraw) 60)

; the local state for acc is kept in E1

; (define acc2 (make-account 100))
; acc is assigned a new environment. The body of make-account is shared between the procedures objects acc and acc2 (although this depends on the Scheme interpreter)
