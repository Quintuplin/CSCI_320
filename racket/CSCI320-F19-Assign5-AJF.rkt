#lang racket
; Run with the command 'racket CSCI320-F19-Assign5-AJF.rkt'

;CSCI 320 Assignment 5
;Jack Fraser
;G. Pothering
;10/24/2019

;1) complex number operations

;complex number operations; numbers involving i (sqrt -1); have complex variants on normal operations, defined below
;complex numbers will in this case be represented by two-element lists
;where the first atom in the list is the real part, and the second is the i part
;e.g. 2.5+3.7i would be denoted as '(2.5 3.7)

;racket documentation suggests inherent 'i' functionality
;https://docs.racket-lang.org/reference/generic-numbers.html

;real - given complex number, returns the real portion
(define (real num) (eval (car(num))))

;complex - given complex number, returns the complex portion
(define (complex num) (eval (cadr(num))))

;compl - given complex number, returns the result of the complement operation
(define (compl num) 
    (list (real num)(- (complex num)))
)

;abs - given complex number, returns the absolute value
(define (abs num) 
    (sqrt (+ (expt (real num) 2) (expt (complex num) 2)))
)

;equal? - given complex num1, num2, returns #t/#f if they are equal
(define (equal? num1 num2) 
    (and (= (real num1) (real num2)) (= (complex num1) (complex num2)))
)

;plus - adds complex num1, num2
(define (plus num1 num2)
    (list (+ (real num1) (real num2)) (+ (complex num1) (complex num2)))
)

;minus - subtracts complex num1, num2
(define (minus num1 num2)
    (list (- (real num1) (real num2)) (- (complex num1) (complex num2)))
)

;prod - multiplies complex num1, num2
(define (prod num1 num2)
    (list 
        (- (* (real num1) (real num2)) (* (complex num1) (complex num2)))
        (+ (* (real num1) (real num2)) (* (complex num1) (complex num2)))
    )
)

;quotient - divides complex num1/num2
(define (quotient num1 num2)
    (list
        (/ 
            (+ (* (real num1) (real num2)) (* (complex num1) (complex num2))) 
            (+ (expt (real num2) 2) (expt (complex num2) 2))
        )
        (/ 
            (- (* (real num2) (complex num1)) (* (real num1) (complex num2))) 
            (+ (expt (real num2) 2) (expt (complex num2) 2))
        )
    )
)

;2) permutation detection

;permutation - take list1, list2, return #t/#f if lists are permutations
(define (permutation list1 list2)(cond
    ((and (null? list1) (null? list2)) #t)
    ((not (= (length list1) (length list2))) #f)
    (else (permutation (remove* list1 (car list1)) (remove* list2 (car list1))))
))

;3) binary tree operations

;tree is of the form (root, left leaf, right leaf)
;root is an atom, leaves can be either atoms or subtrees
;tree? - accepts list as argument, returns #t, #f if valid binary tree
(define (tree? lst)(cond
    ((not (list? (lst))) #f)
    ((null? lst) #t)
    ((not (= (length lst) 3)) #f)
    ((list? (car(lst))) #f)
    (else (and (tree? (cadr(lst))) (tree? (caddr(lst)))))
))

;preorder - accepts tree, returns list of values based on pre-order traversal
;root, left, right
(define (preorder lst)(cond
    ((null? lst) lst)
    (cons (car lst) (append (preorder (cadr lst)) (preorder (caddr lst))))  
))

;inorder - accepts tree, returns list of values based on in-order traversal
;left, root, right
(define (inorder lst)(cond
    ((null? lst) lst)
    (append (inorder (cadr lst)) (cons (car lst) (inorder (caddr lst))))  
))

;postorder - accepts tree, returns list of values based on post-order traversal
;left, right, root
(define (postorder lst)(cond
    ((null? lst) lst)
    (append (postorder (cadr lst)) (postorder (caddr lst)) (list (car lst)))
))
