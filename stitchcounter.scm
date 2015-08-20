#!/bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

;;; stitchcounter.scm

(declare (uses io-utils))

(define cms-per-square 10.0)

;; Calculate stitches from the original gauge
(define (option-1)
  (let* ((orows
          (get-num "Number of rows in the original gauge (4 inches swatch): "))
         (osts
          (get-num "Number of stitches of the original gauge (4 inches swatch): "))
         (rows
          (get-num "Number of rows in your gauge (4 inches swatch): "))
         (sts
          (get-num "Number of stitches in your gauge (4 inches swatch): "))
         (ovalr
          (get-num "Total rows of the original project: "))
         (resr
          (round (/ (* rows ovalr) orows)))
         (ovals
          (get-num "Stitches to CO in the project: "))
         (ress
          (round (/ (* sts ovals) osts))))
    (printf "Final rows: ~A / Final stitches: ~A\n" resr ress)))

;; Calculate stitches from dimensions
(define (option-2)
  (let* ((rows
          (get-num "Number of your rows: "))
         (sts
          (get-num "Number of your stitches: "))
         (rows1cm
          (/ rows cms-per-square))
         (sts1cm
          (/ sts cms-per-square))
         (cm
          (get-num "Cms of your project: "))
         (resr
          (* rows1cm cm))
         (ress
          (* sts1cm cm)))
    (printf "Final rows: ~A / Final stitches: ~A\n" resr ress)))

;; Main
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
