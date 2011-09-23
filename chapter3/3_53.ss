(define s (cons-stream 1 (add-streams s s)))

;s produces the stream: 1, 2, 4, 8, 16 ...
;same as double
