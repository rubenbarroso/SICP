;a
(define (make-semaphore n)
  (let ((mutexes n)
        (lock (make-mutex)))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
             (lock 'acquire)
             (if (= mutexes 0)
                 (begin
                   (lock 'release)
                   (the-semaphore 'acquire))
                 (begin
                   (set! mutexes (- mutexes 1))
                   (lock 'release))))
            ((eq? m 'release) 
             (lock 'acquire)
             (set! mutexes (+ mutexes 1))
             (lock 'release))))
    the-semaphore))

;b
;identical but implementing the acquire and release atomically using test-and-set!
(define (make-semaphore n)
  (let ((mutexes n)
        (lock (list false)))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
             (acquire-lock!)
             (if (= mutexes 0)
                 (begin
                   (release-lock!)
                   (the-semaphore 'acquire))
                 (begin
                   (set! mutexes (- mutexes 1))
                   (release-lock!))))
            ((eq? m 'release) 
             (acquire-lock!)
             (set! mutexes (+ mutexes 1))
             (release-lock!))))
    (define (acquire-lock!)
      (if (test-and-set! lock)
          (acquire-lock!)))
    (define (release-lock!)
      (set-car! lock false))
    (define (test-and-set!)
      (if (car lock)
          true
          (begin (set-car! lock true)
                 false)))
    the-semaphore))