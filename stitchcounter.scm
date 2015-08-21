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
          (get-num "Number of rows/rounds as listed in pattern gauge: "))
         (osts
          (get-num "Number of stitches as listed in pattern gauge: "))
         (rows
          (get-num "Number of rows/rounds in gauge you want to use: "))
         (sts
          (get-num "Number of stitches in gauge you want to use: "))
         (ovalr
          (get-num "Total rows/rounds of pattern: "))
         (resr
          (round (/ (* rows ovalr) orows)))
         (ovals
          (get-num "Stitches to CO for your project: "))
         (ress
          (round (/ (* sts ovals) osts))))
    (printf "Final rows/rounds: ~A / Final stitches: ~A\n" resr ress)))

;; Calculate stitches from dimensions
(define (option-2)
  (let* ((units
          (get-num "Dimension of swatch [4 inches, 10 cms, etc.]: "))
         (rows
          (get-num "Rows/rounds in gauge: "))
         (sts
          (get-num "Stitches in gauge: "))
         (rows1cm
          (/ rows units))
         (sts1cm
          (/ sts units))
         (cm
          (get-num "Cms/inches of your project: "))
         (resr
          (* rows1cm cm))
         (ress
          (* sts1cm cm)))
    (printf "Final rows/rounds: ~A / Final stitches: ~A\n" resr ress)))

;; Main
(define (stitchcounter)
  (print "\nStitchcounter: useful tool to help knitting and crocheting")
  (print "Options:\n")
  (print "\t1 Change gauge in a pattern")
  (print "\t  (Pattern lists gauge and width, you want to knit")
  (print "\t  the same width with a different gauge)\n")
  (print "\t2 Calculate number of stitches to CO")
  (print "\t  (You have a given gauge, calculate how many stiches/rows")
  (print "\t  you need to get a given dimension)\n")
  (print "\t3 Quit")
  (let ((input (get-num "\nPick your option: ")))
    (cond
     ((= 1 input) (option-1))
     ((= 2 input) (option-2))
     ((= 3 input) (exit))
     (else "Please specify a valid option."))))

(stitchcounter)
