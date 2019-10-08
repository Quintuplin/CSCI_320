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

; lambda function, where the value at the tail is assigned to r, and the result of the lambda function is returned
; this is called lambda calculus in math
((lambda (r) (* 3.14 (* r r))) 3.67)

; named expression-- assigning a lambda to a name, which can then be called
(define bmi (lambda (ht wt) (/ (* wt 703.0) (* ht ht))))
(bmi 72 215)

; named expressions in scheme can be contracted significantly
(define (bmi2 ht wt) (/ (* wt 703.0) (* ht ht)))
(bmi2 72 215)

;control flow
(if (= 1 1) 1 2)
(if (= 1 0) 1 2)
; (if (not = count 0) (/ sum count) "divide by 0")

;preferred multi-conditional special form
(define (sgn x) (cond
    ((positive? x) 1)
    ((zero? x) 0)
    (else -1)
))
(sgn 1)
(sgn 0)
(sgn -1)

;try leap year calculations
;pattern: every 4th year is a leap, every 100th year is not a leap, every 400th year is still a leap
;div 400, leap
;div 100 not 400, not leap
;div 4 not 100, leap
(define (leap year) (cond
    ((zero? (remainder year 400)) #t)
    ((zero? (remainder year 100)) #f)
    ((zero? (remainder year 4)) #t)
))
(leap 2000)
(leap 2004)
(leap 2100)
(leap 2400)

;eqv? - when you want to test non-numeric values
;= is good for numbers, eqv is good for other stuff
; both have their quirks
(= 1 1.0)
(eqv? 1 1.0)
(= 1 (- 5 4))
(eqv? 1 (- 5 4))
; (= 'a 'a) invalid statement
(eqv? 'a 'a)

;eq? - compares the pointers to variables - returns true if two names point to the same value