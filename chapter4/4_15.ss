The Halting Problem

(try try) evaluated to

(if (halts? try try)
    (run=forever)
    'halted)

Two possibilities here:

a) (halts? try try) returns true,
   (try try) diverges.

b) (halts? try try) returns false,
   (try try) converges.

Contradiction.
