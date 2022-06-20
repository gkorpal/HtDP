;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise83to86) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t

; WorldState -> WorldState
; an interactive editor
(define (run ed)
  (big-bang ed
    [to-draw render]
    [on-key edit]))

; Editor -> Image
; render the text within an empty scene of 200 x 20 pixels
; a 1 x 20 red rectangle represents cursor
; strings are black text of size 16
(define (render ed)
  (overlay/align "left" "center"
                 (beside
                  (text (editor-pre ed) 16 "black")
                  (rectangle 1 20 "solid" "red")
                  (text (editor-post ed) 16 "black"))
                 (empty-scene 200 20)))
(render (make-editor "hello" "world"))

; Editor KeyEvent -> Editor
; add a single-character ke to the end of
; the pre field of ed, unless ke denotes the backspace
; ("\b") key. In that case, it deletes the character
; immediately to the left of the cursor (if there are any).
; The function ignores the tab key ("\t") and the return
; key ("\r"). The function pays attention to only two
; KeyEvents longer than one letter: "left" and "right".
; The left arrow moves the cursor one character to the left
; (if any), and the right arrow moves it one character to
; the right (if any). All other such KeyEvents are ignored.
(check-expect (edit (make-editor "hello" "world") "a")
              (make-editor "helloa" "world"))
(check-expect (edit (make-editor "hello" "world") "\t")
              (make-editor "hello" "world"))
(check-expect (edit (make-editor "hello" "world") "\r")
              (make-editor "hello" "world"))
(check-expect (edit (make-editor "hello" "world") "\b")
              (make-editor "hell" "world"))
(check-expect (edit (make-editor "hello" "world") "left")
              (make-editor "hell" "oworld"))
(check-expect (edit (make-editor "hello" "world") "right")
              (make-editor "hellow" "orld"))
(check-expect (edit (make-editor "hello" "world") "up")
              (make-editor "hello" "world"))
(check-expect (edit (make-editor "hello" "world") "down")
              (make-editor "hello" "world"))
(check-expect (edit (make-editor "hello" "world") " ")
              (make-editor "hello " "world"))
(define (edit ed ke)
  (cond
    [(= (string-length ke) 1)
     (cond
       [(string=? "\b" ke) (backspace ed)]
       [(string=? "\t" ke) ed]
       [(string=? "\r" ke) ed]
       [else (add-char ed ke)])]
    [(and (string=? "left" ke)
          (> (string-length (editor-pre ed)) 0))
     (move-left ed)]
    [(and (string=? "right" ke)
          (> (string-length (editor-post ed)) 0))
     (move-right ed)]
    [else ed]))

; Editor -> Editor
; auxillary function
(define (backspace ed)
  (cond
    [(> (string-length (editor-pre ed)) 0)
     (make-editor
         (substring (editor-pre ed) 0
                    (- (string-length (editor-pre ed)) 1))
         (editor-post ed))]
    [else ed]))

; Editor String -> Editor
; auxillary function
; stops adding characters when exceeds canvas width
(define (add-char ed ke)
  (cond
    [(< (+ (image-width (text (editor-pre ed) 16 "black"))
           (image-width (text (editor-post ed) 16 "black")))
        190)
     (make-editor (string-append (editor-pre ed) ke)
                           (editor-post ed))]
    [else ed]))

; Editor -> Editor
; auxillary function
(define (move-left ed)
       (make-editor
         (substring (editor-pre ed) 0
                    (- (string-length (editor-pre ed)) 1))
         (string-append (string-ith
                         (editor-pre ed)
                         (- (string-length (editor-pre ed)) 1))
                        (editor-post ed))))
; Editor -> Editor
; auxillary function
(define (move-right ed)
  (make-editor
         (string-append (editor-pre ed)
          (string-ith (editor-post ed) 0))
         (substring (editor-post ed) 1)))