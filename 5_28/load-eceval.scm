;;;; LOADS THE EXPLICIT-CONTROL EVALUATOR FROM SECTION 5.4 OF
;;;; STRUCTURE AND INTERPRETATION OF COMPUTER PROGRAMS, WITH
;;;; ALL THE SUPPORTING CODE IT NEEDS IN ORDER TO RUN.

;;;; **NB** The actual "load" calls are implementation dependent.

(load "5_28/ch5-regsim.scm")			;reg machine simulator

;; **NB** next file contains another "load"
(load "5_28/ch5-eceval-support.scm")		;simulation of machine operations

(load "5_28/ch5-eceval.scm")			;eceval itself