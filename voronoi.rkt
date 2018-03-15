#lang racket

(require 2htdp/image)
(require 2htdp/universe)

;; These are the world states
;; The world will be a before before the program starts running the algorithm
;; The world will be a working while the algorithm is running

;; A state is: (state (list-of (pair x y)))
;; A working is (working (list-of (pair x y)))
(struct before (points))
(struct working (points))

(define START-BUTTON (overlay (text "START" 22 'black) (rectangle 100 50 'solid 'PaleTurquoise)))


(define (render s)
  (above (foldr (lambda (v im) (place-image (circle 3 'solid 'red) (car v) (cdr v) im))
                (empty-scene 900 600)
                (before-points s))
         START-BUTTON))

(define (add-point last-state x y event)
  (if (equal? event "button-down")
  (struct-copy before last-state [points (cons (cons x y) (before-points last-state))])
  last-state))

(define (begin) (big-bang (before '())
                          (on-mouse (lambda (st x y event) (if
                                                            (before? st)
                                                            (add-point st x y event)
                                                            st)))
                          (to-draw render)))