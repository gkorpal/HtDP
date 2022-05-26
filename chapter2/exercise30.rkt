;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise30) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; constants
(define FIXED-COST 180)
(define VARIABLE-COST 0.04)
(define PEOPLE 120)
(define PRICE 5)
(define PEOPLE-CHANGE 15)
(define PRICE-CHANGE 0.1)

(define PRICE-SENSITIVITY (/ PEOPLE-CHANGE PRICE-CHANGE))

; functions
(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))

(define (cost ticket-price)
  (+ FIXED-COST (* VARIABLE-COST (attendees ticket-price))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (attendees ticket-price)
  (- PEOPLE (* (- ticket-price PRICE) PRICE-SENSITIVITY)))

; testing
(profit 1)
(profit 2)
(profit 3)
(profit 4)
(profit 5)

; $3 is the best among these