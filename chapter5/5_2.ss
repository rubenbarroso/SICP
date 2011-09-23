(controller
   (assign counter (const 1))
   (assign product (const 1))
 test-counter
   (test (op >) (reg counter) (reg n))
   (branch (label fact-done))
   (assign product (op *) (reg counter) (reg product))
   (assign counter (op +) (const 1) (reg counter))
   (goto (label test-counter))
 fact-done)
