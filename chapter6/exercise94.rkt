;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise94) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)


(define WIDTH 200)
(define HEIGHT 200)
(define BACKGROUND (empty-scene WIDTH HEIGHT))
(define UFO (overlay (circle 10 "solid" "green")
         (rectangle 40 4 "solid" "green")))
(define TANK (rectangle 40 20 "solid" "blue"))
(define MISSILE (triangle 10 "solid" "black"))
; A UFO is a Posn. 
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)

(define-struct tank [loc vel])
; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick

; A Missile is a Posn. 
; interpretation: (make-posn x y) is the missile's place

(define-struct aim [ufo tank])
; aim is
;   (make-aim UFO Tank)
; interpretation: getting the tank in position for a shot

(define-struct fired [ufo tank missile])
; fired is
;   (make-fired Posn Tank Posn)
; interpretation: represents states after the
; missile is fired

; A SIGS is one of: 
; – (make-aim UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation: represents the complete state of a 
; space invader game

; SIGS -> Image
; adds TANK, UFO, and possibly MISSILE to 
; the BACKGROUND scene
(define (si-render s)
  (cond
    [(aim? s) (place-image
               UFO (posn-x (aim-ufo s)) (posn-y (aim-ufo s))
               BACKGROUND)]
    [(fired? s) (place-image
               UFO (posn-x (aim-ufo s)) (posn-y (aim-ufo s))
               BACKGROUND)]))

; incomplete