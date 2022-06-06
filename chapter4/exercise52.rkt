;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname UFO_descending) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require  2htdp/image)
(require 2htdp/universe)

; A WorldState is a Number.
; interpretation number of pixels between the top and the UFO
 
(define WIDTH 300) ; distances in terms of pixels 
(define HEIGHT 100)
(define CLOSE (/ HEIGHT 3))
(define MTSCN (empty-scene WIDTH HEIGHT))
(define UFO (overlay (circle 10 "solid" "green")
                     (rectangle 40 4 "solid" "green")))
 
; WorldState -> WorldState
(define (main y0)
  (big-bang y0
     [on-tick nxt]
     [to-draw render]
     [stop-when end?]))
 
; WorldState -> WorldState
; computes next location of UFO 
(check-expect (nxt 11) 14)
(define (nxt y)
  (+ y 3))
 
; WorldState -> Image
; places UFO at given height into the center of MTSCN
;(check-expect (render 11)
            ;  (place-image UFO (/ WIDTH 2) 11 MTSCN))
(define (render y)
  (cond
    [(<= 0 y CLOSE)
     (place-images
      (list UFO (text "descending" 16 "red"))
      (list (make-posn (/ WIDTH 2) y)
            (make-posn (/ WIDTH 4) (- HEIGHT 8)))
      MTSCN)]
       [(< CLOSE y HEIGHT)
     (place-images
      (list UFO (text "closing in" 16 "yellow"))
      (list (make-posn (/ WIDTH 2) y)
            (make-posn (/ WIDTH 4) (- HEIGHT 8)))
      MTSCN)]
       [(>= y HEIGHT)
     (place-images
      (list UFO (text "landed" 16 "green"))
      (list (make-posn (/ WIDTH 2) y)
            (make-posn (/ WIDTH 4) (- HEIGHT 8)))
      MTSCN)]))

; WorldState -> Boolean
; after each event, big-bang evaluates (end? ws)
; stops the animation when the ship has disappeared
(define (end? y)
  (> y (nxt HEIGHT)))