;the data abstraction in make-execution-procedure isolates us from the changes
;let's implement a new operation:
;
; (jump0 (reg x) (label y))
;
; branches to a location indicated by a label y if the contents of register x are 0.

(define (make-execution-procedure inst labels machine
                                  pc flag stack ops)
  (cond ((eq? (car inst) 'assign)
         (make-assign inst machine labels ops pc))
        ((eq? (car inst) 'test)
         (make-test inst machine labels ops flag pc))
        ((eq? (car inst) 'branch)
         (make-branch inst machine labels flag pc))
        ((eq? (car inst) 'goto)
         (make-goto inst machine labels pc))
        ((eq? (car inst) 'jump0)
         (make-jump0 inst machine labels pc))
        ((eq? (car inst) 'save)
         (make-save inst machine stack pc))
        ((eq? (car inst) 'restore)
         (make-restore inst machine stack pc))
        ((eq? (car inst) 'perform)
         (make-perform inst machine labels ops pc))
        (else (error "Unknown instruction type - ASSEMBLE"
                     inst))))

(define (make-jump0 inst machine labels pc)
  (let* ((reg (get-register machine (jump0-reg-name inst)))
         (label (jump0-label-name inst))
         (insts (lookup-label labels (label-exp-label label))))
    (lambda ()
      (if (eq? (get-contents reg) 0)
          (set-contents! pc insts)
          (advance-pc pc)))))

(define (jump0-reg-name jump0-instruction)
  (cadr jump0-instruction))

(define (jump0-label-name jump0-instruction)
  (caddr jump0-instruction))
