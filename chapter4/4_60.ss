;the duplicates appear because lives-near basically performs a Cartesian product of the set of persons, resulting in a set whose elements are pairs that
;meet the following rule:
;Being P=(a,b) and Q=(c,d) two pairs members of the set returned by lives-near, P=Q iff a=c and b=d

;the only way to remove duplicates that I can think of is replacing the application of the same rule by a rule that imposes some kind of order between the
;person names, maybe using lisp-value.
