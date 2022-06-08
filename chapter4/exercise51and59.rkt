;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise51and59) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume

(define RED
  (overlay/xy
   (overlay/xy
    (overlay/xy
     (rectangle 60 20 "outline" "black")
     10
     5
     (circle 5 "solid" "red"))
    25
    5
    (circle 5 "outline" "yellow"))
   40
   5
   (circle 5 "outline" "green")))

(define YELLOW
  (overlay/xy
   (overlay/xy
    (overlay/xy
     (rectangle 60 20 "outline" "black")
     10
     5
     (circle 5 "outline" "red"))
    25
    5
    (circle 5 "solid" "yellow"))
   40
   5
   (circle 5 "outline" "green")))

(define GREEN
  (overlay/xy
   (overlay/xy
    (overlay/xy
     (rectangle 60 20 "outline" "black")
     10
     5
     (circle 5 "outline" "red"))
    25
    5
    (circle 5 "outline" "yellow"))
   40
   5
   (circle 5 "solid" "green")))

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))

; TrafficLight -> TrafficLight
; yields the next state, given current state cs
(define (tl-next cs)
  (cond
    [(string=? "red" cs) "green"]
    [(string=? "green" cs) "yellow"]
    [(string=? "yellow" cs) "red"]))

; TrafficLight -> Image
; renders the current state cs as an image
(check-expect (tl-render "red") RED)
(check-expect (tl-render "yellow") YELLOW)
(check-expect (tl-render "green") GREEN)
(define (tl-render current-state)
   (cond
    [(string=? "red" current-state) RED]
    [(string=? "green" current-state) GREEN]
    [(string=? "yellow" current-state) YELLOW]))
