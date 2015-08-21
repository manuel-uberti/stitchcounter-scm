;;; Library io-utils.scm
;; Common I/O utilities
(declare (unit io-utils))

(use extras)
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
    (if (number? (string->number vc))
        (string->number vc)
        (get-num (conc "Please specify a valid number.\n" prompt)))))
