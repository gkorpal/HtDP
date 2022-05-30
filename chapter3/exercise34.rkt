;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Non-empty string -> first character
; extracts the first character from a non-empty string str
; given: "hello", expect: "h"
; given: "buffalo", expect: "b"
(define (string-first str)
  (string-ith str 0))

(string-first "hello")
(string-first "buffalo")