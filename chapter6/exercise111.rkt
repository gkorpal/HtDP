;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise111) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct vec [x y])
; A vec is
;   (make-vec PositiveNumber PositiveNumber)
; interpretation represents a velocity vector

; Any -> Velocity vector
; checked version of the primitive make-vec operation
(define (checked-make-vec dx dy)
  (cond
    [(and (and (number? dx) (< 0 dx))
          (and (number? dy) (< 0 dy)))
     (make-vec dx dy)]
    [else (error "only positive numbers allowed")]))

(checked-make-vec 8 9)
(checked-make-vec 0 9)
