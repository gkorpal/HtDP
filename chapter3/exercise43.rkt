;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise43) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; CAR constants with WHEEL-RADIUS as the
; single point of control
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 3))
(define BODY-HEIGHT (* WHEEL-RADIUS 2))
(define BODY-WIDTH (+ (* WHEEL-RADIUS 6) WHEEL-DISTANCE))
(define ROOF-WIDTH (+ (* WHEEL-RADIUS 2) WHEEL-DISTANCE))

; BACKGROUND (no-tree)
(define WIDTH-OF-WORLD (* 40 WHEEL-RADIUS))
(define HEIGHT-OF-WORLD (* 40 WHEEL-RADIUS))
(define BACKGROUND (empty-scene WIDTH-OF-WORLD
                                HEIGHT-OF-WORLD))
;(define Y-CAR (- HEIGHT-OF-WORLD (* WHEEL-RADIUS 2)))
(define (CAR-TRACK t) (- (*
                          (- HEIGHT-OF-WORLD
                             (* WHEEL-RADIUS 2))
                          (cos t))))

; Derived constants/CAR parts
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "white"))
(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define BODY
  (rectangle BODY-WIDTH BODY-HEIGHT "solid" "red"))
(define ROOF
  (rectangle ROOF-WIDTH WHEEL-RADIUS "solid" "red"))
(define BOTTOM
  (overlay/align/offset "middle" "middle"
   BOTH-WHEELS 0 (- WHEEL-RADIUS) BODY))

(define CAR
  (above ROOF BOTTOM))

; An AnimationState is a Number.
; interpretation: the number of clock ticks 
; since the animation started

; AnimationState -> AnimationState
; launches the program from some initial state
(define (main as)
  (big-bang as
    [on-tick tock]
    [on-key reset]
    [to-draw render]
    [stop-when end?]))

; AnimationState -> Image
; places the image of the car (x,y) pixels from
; the left margin of the BACKGROUND image
(check-expect (render 0)
              (place-image CAR 0 (CAR-TRACK 0) BACKGROUND))
(check-expect (render 50)
              (place-image CAR 50 (CAR-TRACK 50) BACKGROUND))
(define (render cw)
  (place-image CAR cw (CAR-TRACK cw) BACKGROUND))

; AnimationState -> AnimationState
; for each tick of the clock, big-bang obtains
; the time progression
(check-expect (tock 20) 21)
(check-expect (tock 78) 79)
(define (tock cw)
  (+ cw 1))

; AnimationState String -> AnimationState
; for each keystroke, big-bang obtains the next state
; resets to 0
(define (reset cw ke)
  0)

; AnimationState -> Boolean
; after each event, big-bang evaluates (end? ws)
; stops the animation when the car has disappeared
; on the right side.
(define (end? cw)
  (>= cw
      (+ WIDTH-OF-WORLD (* 0.5 BODY-WIDTH))))