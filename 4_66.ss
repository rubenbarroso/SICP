;the following would not work because the salary of Oliver Warbucks would be accumulated four times.
(sum ?amount 
     (and (wheel ?who)
          (salary ?who ?amount))))

;One way to avoid this is remove the duplicates from the output stream of frames