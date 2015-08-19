#!/bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

;;; stitchcounter.scm

(use extras)
(use loops)
(use input-parse)

(define cms-per-square 10.0)

(define (get-input prompt)
  (printf "~A" prompt)
  (read-text-line))

(define (get-number prompt)
  (let ((v (get-input prompt)))
    (do-forever
     (if (number? (string->number v))
         (exit (string->number v)))
     (printf "Please specify a valid number.")
     v)))

(define (option-1)
  (let* ((orows
          (get-number "Enter the number of rows in the original gauge (4 inches swatch): "))
         (osts
          (get-number "Enter the number of stitches of the original gauge (4 inches swatch): "))
         (rows
          (get-number "Enter the number of rows in your gauge (4 inches swatch): "))
         (sts
          (get-number "Enter the number of stitches in your gauge (4 inches swatch): "))
         (ovalr
          (get-number "Enter the total rows of the original project: "))
         (resr
          (round (/ (* rows ovalr) orows)))
         (ovals
          (get-number "Enter the stitches to CO in the project: "))
         (ress
          (round (/ (* sts ovals) osts))))
    (printf "Final rows: ~A / Final stitches: ~A\n" resr ress)))

(define (option-2)
  (let* ((rows
          (get-number "Enter the number of your rows: "))
         (sts
          (get-number "Enter the number of your stitches: "))
         (rows1cm
          (/ rows cms-per-square))
         (sts1cm
          (/ sts cms-per-square))
         (cm
          (get-number "Enter the cms of your project: "))
         (resr
          (* rows1cm cm))
         (ress
          (* sts1cm cm)))
    (printf "Final rows: ~A / Final stitches: ~A\n" resr ress)))

(define (stitchcounter)
  (print "\nStitchcounter: useful tool to help knitting and crocheting")
  (print "Options:")
  (print "\t1 Calculate stitches from original gauge")
  (print "\t2 Calculate stitches from dimensions")
  (print "\t3 Quit")
  (let ((input (get-input "Pick your option: ")))
    (cond
     ((string=? "1" input) (option-1))
     ((string=? "2" input) (option-2))
     ((string=? "3" input) (exit))
     (else "Please specify a valid option."))))

(stitchcounter)
