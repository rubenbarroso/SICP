;I recommend to read secion 4.4.2 "How the Query System Works" prior to 
;doing this exercise. I didn't understood how to infer the results up
;until I read it. I even posted a question in http://stackoverflow.com/questions/4407135/how-does-append-to-form-work-sicps-section-on-logic-programming
;requesting information about how append-to-form works.

;seek in the yellow pad the steps I performed to solve this (before posting this to the blog, draw a diagram with omnigraffle)

(rule (?x next-to ?y in (?x ?y .?u)))

(rule (?x next-to ?y in (?v . ?z))
      (?x next-to ?y in ?z))

;;; Query input:
(?x next-to ?y in (1 (2 3) 4))
;;; Query results:
((2 3) next-to 4 in (1 (2 3) 4))
(1 next-to (2 3) in (1 (2 3) 4))

;;; Query input:
(?x next-to ?y in (2 1 3 1))
;;; Query results:
(3 next-to 1 in (2 1 3 1))
(2 next-to 1 in (2 1 3 1))
