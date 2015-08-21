;;; Library io-utils.scm
;; Common I/O utilities
(declare (unit io-utils))

(use extras)
(use loops)
(use input-parse)

;; Print a prompt and wait for an input from the user
(define (get-input prompt)
  (printf "~A" prompt)
  (read-text-line))

;; Print a prompt and specifically ask for a number
(define (get-num prompt)
  (let* ((v (get-input prompt))
         (vl (string-split v " " #f))
         (vc (car vl)))
    (do-forever
     (if (number? (string->number vc))
         (exit (string->number vc)))
     (printf "Please specify a valid number.")
     vc)))
