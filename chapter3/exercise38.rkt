;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise38) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; string -> string
; removes the last character of str
; given: "hello", expect: "hell"
; given: "buffalo", expect: "buffal"
(define (string-remove-last str)
  (substring str 0 (- (string-length str) 1)))

(string-remove-last "hello")
(string-remove-last "buffalo")