#lang racket

(require 2htdp/image)
(require 2htdp/universe)

;; A state is: (state (list-of (pair x y)))
(struct state (points))

(define START-BUTTON (overlay (text "START" 22 'black) (rectangle 100 50 'solid 'PaleTurquoise)))


(define (render s)
  (above (foldr (lambda (v im) (place-image (circle 3 'solid 'red) (car v) (cdr v) im))
                (empty-scene 900 600)
                (state-points s))
         START-BUTTON))

(define (add-point last-state x y event)
  (if (equal? event "button-down")
  (struct-copy state last-state [points (cons (cons x y) (state-points last-state))])
  last-state))

(define (begin) (big-bang (state '())
                          (on-mouse add-point)
                          (to-draw render)))