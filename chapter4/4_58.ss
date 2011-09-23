;it does not have a supervisor who works in the division -> it does not have supervisor or its supervisor works in another division
(rule (big-shot ?person ?division)
      (and (job ?person (?division . ?s))
           (or (not (supervisor ?person ?supervisor))
               (and (supervisor ?person ?supervisor)
                    (not (job ?supervisor (?division . ?t)))))))


