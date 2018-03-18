#lang racket

(provide
 dist)

;; Number Number Number Number -> Number
;; Euclidean distance between two points in two-dimensional space
(define (dist x1 y1 x2 y2)
  (sqrt (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2))))