;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #f)))
(require 2htdp/image)

; to change scale use (scale factor (above ... ))

; boat
(above (right-triangle 36 48 "solid" "black")
       (polygon (list (make-posn 0 0)
                      (make-posn 80 0)
                      (make-posn 60 20)
                      (make-posn 20 20))
                "solid"
                "black"))

; tree
(above (overlay/offset (overlay/offset (triangle 40 "solid" "green")
                                       0 17
                                       (triangle 40 "solid" "green"))
                       0 27
                       (triangle 40 "solid" "green"))
       (rectangle 15 25 "solid" "brown"))