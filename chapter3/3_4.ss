(define (make-account balance password)
  (let ((attempts 0))
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (dispatch p m)
      (if (eq? p password)
          (cond ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                (else (error "Unknown request -- MAKE-ACCOUNT"
                             m)))
          (if (= attempts 6)
              (call-the-cops)
              (begin 
                (set! attempts (+ attempts 1))
                (error "Incorrect password")))))
    dispatch))

(define (call-the-cops) (error "You're busted!"))

(define acc (make-account 100 'secret-password))

;((acc 'secret-password 'withdraw) 40)
;60
;((acc 'some-other-password 'deposit) 50)
;Incorrect password
;((acc 'some-other-password 'deposit) 50)
;Incorrect password
;((acc 'some-other-password 'deposit) 50)
;Incorrect password
;((acc 'some-other-password 'deposit) 50)
;Incorrect password
;((acc 'some-other-password 'deposit) 50)
;Incorrect password
;((acc 'some-other-password 'deposit) 50)
;Incorrect password
;((acc 'some-other-password 'deposit) 50)
;You're busted!
