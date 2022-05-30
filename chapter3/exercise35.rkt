;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise35) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; non-empty string -> last character
; extracts the last character from str
; given: "hello", expect: "o"
; given: "buffalo", expect: "o"
(define (string-last str)
  (string-ith str (- (string-length str) 1)))

(string-last "hello")
(string-last "buffalo")