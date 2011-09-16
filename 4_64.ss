(rule (outranked-by ?staff-person ?boss)
      (or (supervisor ?staff-person ?boss)
          (and (outranked-by ?middle-manager ?boss)
               (supervisor ?staff-person ?middle-manager))))

;When (outranked-by (Bitdiddle Ben) ?who) is evaluated, it is unified with the rule above, resulting in an extended frame with the following bindings:
;?staff-person = (Bitdiddle Ben)
;?who = ?boss
;
;The body of the rule is evaluated using this frame:
;
;(or (supervisor (Bitdiddle Ben) ?who)
;    (and (outranked-by ?middle-manager ?who)
;         (supervisor (Bitdiddle Ben) ?middle-manager)))
;
;Here, the two or queries are evaluated in parallel, and in turn the and query evaluates its two queries in series, being the first one:
;
;(outranked-by ?middle-manager ?who)
;
;This unified with the rule again indefinitely. With the original rule, the first and query:
;
;(supervisor ?staff-person ?middle-manager)
;
;restrained the search space of the consequent and query, avoiding the infinite recursion.