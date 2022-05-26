;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise29) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; opaque function
(define (profit-op price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (* 1.5
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price))))))


(profit-op 3)
(profit-op 4)
(profit-op 5)

; one function per task
; constants
(define FIXED-COST 0)
(define VARIABLE-COST 1.50)
(define PEOPLE 120)
(define PRICE 5)
(define PEOPLE-CHANGE 15)
(define PRICE-CHANGE 0.1)

; functions
(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))

(define (cost ticket-price)
  (+ FIXED-COST (* VARIABLE-COST (attendees ticket-price))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (attendees ticket-price)
  (- PEOPLE (* (- ticket-price PRICE)
               (/ PEOPLE-CHANGE PRICE-CHANGE))))


(profit 3)
(profit 4)
(profit 5)