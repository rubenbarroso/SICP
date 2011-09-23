;simple-query requires the result of apply-rules to be delayed because otherwise we may incur in infinite recursions.
;The example given in section 4.4.3 shows us how this may happen:
;
;(assert! (married Minnie Mickey))
;
;(assert! (rule (married ?x ?y)
;               (married ?y ?x)))
;(married Mickey ?who)
;
;(married ?who Mickey) ;matches against the rule
;(married Minnie Mickey) ;matches against the assertion AND the rule
;(married Mickey Minnie)
;...
;the above happens because the matching agains the rules is not delayed in Louis's version of simple-query.
;with the delayed version, the application of the rules is not done immediately, and at least we get the
;results of matching agains the assertions