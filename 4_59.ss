;a
(meeting ?division (Friday . ?time))

;b
(rule (meeting-time ?person ?day-and-time)
      (or (meeting whole-company ?day-and-time)
          (and (job ?person (?division . ?s))
               (meeting ?division ?day-and-time))))

;c
(and (meeting-time (Hacker Alyssa P) (Wednesday . ?time))
     (meeting ?division (Wednesday . ?time))) ;we want to know the division also





