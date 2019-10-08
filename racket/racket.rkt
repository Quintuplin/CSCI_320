#lang racket
(+ 3 5)

; Run with the command 'racket racket/racket.rkt'

(caddr '(apple orange pear grapefruit))

(car(caddar '(((apple) (orange) (pear) (grapefruit))))) ;caaddar

(car(caaddr '(apple (orange) ((pear) (grapefruit))))) ;caaaddr

(cadar '((((apple) orange) pear) grapefruit))

'pear

(list 1 2 'a 4 'c)