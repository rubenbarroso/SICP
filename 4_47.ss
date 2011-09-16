(define (parse-verb-phrase)
  (amb (parse-word verbs)
       (list 'verb-phrase
             (parse-verb-phrase)
             (parse-prepositional-phrase))))

;using the previous version with "the student sleeps" works for the first time, but when we try again, it makes the process enter into an infinite recursion because parse-prepositional-phrase fails. Using block strucure for the the amb evaluation in the first place prevents us from this failure

;changing the order of the expressions in amb does not work either. It fails the first time parse-verb-phrase is invoked
