;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise134) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; List-of-names -> Boolean
; determines whether s occurs on alon
(check-expect
  (contains? "Flatt" (cons "X" (cons "Y"  (cons "Z" '()))))
  #false)
(check-expect
  (contains? "Flatt" (cons "A" (cons "Flatt" (cons "C" '()))))
  #true)
(define (contains? s alon)
  (cond
    [(empty? alon) #false]
    [(string=? (first alon) s) #true]
    [else (contains? s (rest alon))]))

(contains? "Flatt" (cons "Fagan"
  (cons "Findler"
    (cons "Fisler"
      (cons "Flanagan"
        (cons "Flatt"
          (cons "Felleisen"
            (cons "Friedman" '()))))))))