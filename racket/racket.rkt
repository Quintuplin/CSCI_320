#lang racket
(+ 3 5)

; Run with the command 'racket racket/racket.rkt'

(caddr '(apple orange pear grapefruit))

(car(caddar '(((apple) (orange) (pear) (grapefruit))))) ;caaddar

(car(caaddr '(apple (orange) ((pear) (grapefruit))))) ;caaaddr

(cadar '((((apple) orange) pear) grapefruit))

'pear

(cons 1 2)

(cons '(1 2) 2)

(list 1 2 'a 4 'c)

(list? (list 1 2 'a 4 'c))

(list? 1)

(list? '(1 2 'a 4 'c))
