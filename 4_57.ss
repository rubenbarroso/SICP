;person-1 can replace person-2
(rule (?person-1 can-replace ?person-2)
      (and (or (and (job ?person-1 ?job)
                    (job ?person-2 ?job))
               (and (job ?person-1 ?job-1)
                    (job ?person-2 ?job-2)
                    (can-do-job ?job-1 ?job-2)))
           (not (same ?person-1 ?person-2))))

;a
(?person can-replace (Fect Cy D))

;b
(and (?person-1 can-replace ?person-2)
     (salary ?person-1 ?salary-1)
     (salary ?person-2 ?salary-2)
     (lisp-value > ?salary-2 ?salary-1))
