(define (add-assertion! assertion)
  (store-assertion-in-index assertion)
  (let ((old-assertions THE-ASSERTIONS))
    (set! THE-ASSERTIONS
          (cons-stream assertion old-assertions))
    'ok))

;vs

(define (add-assertion! assertion)
  (store-assertion-in-index assertion)
  (set! THE-ASSERTIONS
        (cons-stream assertion THE-ASSERTIONS))
  'ok)

;using lets prevents the current contents of THE-ASSERTIONS from being lost by using aliasing. If we don't use let,
;all the contents of THE-ASSERTIONS are lost because by the time they are requested, THE-ASSERTIONS points to itself


  