#lang racket
; Run with the command 'racket racket/functions.rkt'

;member? - returns #t if atom is in a list, #f otherwise
(define (member? atom lst)(cond
    ((null? lst) #f)
    ((eqv? (car lst) atom) #t)
    (else (member? atom (cdr lst)))
))

'(test member)
(member? 1 '(1 2 3))
(member? 1 '(2 1 3))
(member? 1 '(2 2 3))

;append - takes two lists, returns list 1 then list 2
(define (append list1 list2)(cond
    ((null? list1) list2)
    (else (cons (car list1) (append (cdr list1) list2)))
))

'(test append)
(append '() '(1))
(append '(1) '())
(append '(1 2 3) '(4 5 6))

;reverse - takes list, returns reversed list
(define (reverse lst)(cond
    ((null? lst) lst)
    (else (append (reverse (cdr lst)) (list(car lst))))
))

'(test reverse)
(reverse '(1 2 3))
(reverse '(4 5 6))

;sqr
(define (sqr x) (* x x))

'(test sqr)
(sqr 1)
(sqr 2)
(sqr 4)

;apply_to_all - applies a single-value function to every value within a list, returns list
(define (apply_to_all func lst)(cond
    ((null? lst) lst)
    (else (cons (func (car lst)) (apply_to_all func (cdr lst))))
))

'(test apply_to_all)
(apply_to_all sqr '(1 2 3))
(apply_to_all sqr '(2 1 4))

;factorial (tail recursive)
(define (auxfact n result) (cond
    ((= n 0) result)
    (else(auxfact(- n 1) (* n result)))
))

(define (factorial n) (auxfact n 1))

'(test factorial)
(factorial 2)
(factorial 3)
(factorial 4)