;recursive version
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

In the global env, a binding 'factorial' is created.

(factorial 6)

A new environment E1 is created, containing a frame with n bound to 6, and whose enclosing env is global.

(* 6 (factorial 5))

A new environment E2 is created, containing a frame with n bound to 5, and whose enclosing env is global.

...

And so on, until we get:

(* 6 (* 5 (* 4 (* 3 (* 2 (factorial 1))))))

In this case, (factorial 1) creates a new environment E6 containing a frame with n bound to 1, and whose enclosing environment is global.

;iterative version
(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

In the global env, two bindings 'factorial' and 'fact-iter' are created.

(factorial 6)

A new environment E1 is created, containing a frame with n bound to 6.

(fact-iter 1 1 6)

Environment E2 with a frame containing product bound to 1, counter to 1, and max-count to 6.

(fact-iter 1 2 6)

E3, product: 1, counter: 1, max-count: 6

(fact-iter 2 3 6)

E4, product: 2, counter: 3, max-count: 6

(fact-iter 6 4 6)

E5, product: 6, counter: 4, max-count: 6

(fact-iter 24 5 6)

E6, product: 24, counter: 5, max-count: 6

(fact-iter 120 6 6)

E7, product: 120, counter: 6, max-count: 6

(fact-iter 720 7 6)

E8, product: 720, counter: 7, max-count: 6
