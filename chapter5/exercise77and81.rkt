;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise77and81) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct time [hrs min sec])
; A time is a structure:
;   (make-time Number Number Number). 
; interpretation (make-time hrs min sec)
; describes time since midnight in terms of  
; hrs hours, min minutes and sec seconds
(make-time 10 2 15)

; Time -> Number
; converts time since midnight to seconds
(check-expect (time->seconds (make-time 12 30 2))
              45002)
(define (time->seconds t)
  (+ (time-sec t)
     (* (time-min t) 60)
     (* (time-hrs t) 3600)))