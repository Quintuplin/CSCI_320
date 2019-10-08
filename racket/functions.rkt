#lang racket
; Run with the command 'racket racket/functions.rkt'

;member? - returns #t if atom is in a list, #f otherwise
(define (member? atom list)(cond
    ((null? list) #f)
    ((eqv? (car(list)) atom) #t)
    (else (member? atom cdr(list)) #t)
))

(member 1 '(1 2 3))
(member 1 '(2 1 3))
(member 1 '(2 1))
(member 1 '(1))
(member 1 '(2))