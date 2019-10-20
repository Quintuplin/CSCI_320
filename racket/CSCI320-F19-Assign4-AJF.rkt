#lang racket
; Run with the command 'racket CSCI320-F19-Assign4-AJF.rkt'

;CSCI 320 Assignment 4
;Jack Fraser
;G. Pothering
;10/22/2019

;make_list_size - takes number n, expression e; creates a list containing n copies of e
(define (make_list_size n e)(cond
    ((<= n 0) '())
    (else(cons e (make_list_size (- n 1) e)))
))

'(test make_list_size)
(make_list_size 2 4)
(make_list_size 3 '(2))
(make_list_size 4 '(a b c))

;zeros - takes simple list of numbers, returns count of 0s
(define (zeros lst)(cond
    ((null? lst) 0)
    ((= (car lst) 0) (+ (zeros (cat lst)) 1))
    (else (zeros (cat lst)))
))

'(test zeros)
(zeros '())
(zeros '(1 0 2 3 0 4))
(zeros '(1 2 3 4))

;power - accepts numeric atom a, integer b, returns a^b
(define (power a b)(cond
    ((= a 0) 0)
    ((and (= b 0) (> a 0)) 1)
    ((and (= b 0) (< a 0)) -1)
    ((< b 0) (power (/ 1 a) (- 0 b)))
    ((> b 0) (* (power a (- b 1)) a))
))

'(test power)
(power 0 2)
(power 2 0)
(power -2 0)
(power 2.5 3)
(power 2.1 -3)
(power -2.25 3)
(power -4.2 -2)

;remove - takes list, atom, removes all top-level instances of atom from list
(define (remove lst atom)(cond
    ((null? lst) lst)
    ((eqv? (car lst) atom) (remove (cdr lst) atom))
    (else (cons (car lst) (remove (cdr lst) atom)))
))

;largest - accepts list of numbers, returns largest value; if empty, return empty list
(define (auxlargest lst max)(cond
    ((null? lst) max)
    ((> max (car lst)) (auxlargest (cdr lst) max))
    (else (auxlargest (cdr lst) (car lst)))
))

(define (largest lst) (auxlargest lst (car lst)))

'(test largest)
(largest '(1 2 3 4 5))
(largest '(5 4 3 2 1))
(largest '(1 2 3 2 1))