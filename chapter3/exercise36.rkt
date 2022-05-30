;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise36) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
; image -> pixels
; counts the number of pixels in img
; given: (circle 3 "solid" "red"), expected: 36
; this circle is enclosed in a square of side 6
; given: (square 4 "outline" "blue"), expected: 16
(define (image-area img)
  (* (image-width img) (image-height img)))

(image-area (circle 3 "solid" "red"))
(image-area (square 4 "outline" "blue"))