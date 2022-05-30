;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise37) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; string -> string
; remove first character of str
; given: "hello", expect: "ello"
; given: "buffalo", expect: "ufaalo"
(define (string-rest str)
  (substring str 1))

(string-rest "hello")
(string-rest "buffalo")