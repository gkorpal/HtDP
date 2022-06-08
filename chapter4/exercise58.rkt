;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise58) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A Price falls into one of three intervals:
; - 0 through 1000
; - 1000 through 10000
; - 10000 and above
; interpretation the price of an item

; constant deifnitions for easy modification
(define LOW 1000)
(define LUXURY 10000)

; Price -> Number
; computes the amount of tax charged for p
(check-expect (sales-tax 0) 0) ; border
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) (* 0.05 1000)) ; border
(check-expect (sales-tax 1282) (* 0.05 1282))
(check-expect (sales-tax 10000) (* 0.05 10000)) ; border
(check-expect (sales-tax 12017) (* 0.08 12017))
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p LOW)) 0]
    [(< LUXURY p) (* 0.08 p)]
    [else (* 0.05 p)]))
