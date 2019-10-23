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
(define (real num) (car num))

'(test real)
(real '(2.5 3.7))

;complex - given complex number, returns the complex portion
(define (complex num) (cadr num))

'(test complex)
(complex '(2.5 3.7))

;compl - given complex number, returns the result of the complement operation
(define (compl num)
    (list (real num)(- (complex num)))
)

'(test compl)
(compl '(2.5 3.7))

;abs - given complex number, returns the absolute value
(define (abs num)
    (sqrt (+ (expt (real num) 2) (expt (complex num) 2)))
)

'(test abs)
(abs '(2.5 3.7))

;equal? - given complex num1, num2, returns #t/#f if they are equal
(define (equal? num1 num2)
    (and (= (real num1) (real num2)) (= (complex num1) (complex num2)))
)

'(test equal?)
(equal? '(2.5 3.7) '(2.5 3.7))
(equal? '(2.5 3.7) '(2.5 3.8))
(equal? '(2.4 3.7) '(2.5 3.7))

;plus - adds complex num1, num2
(define (plus num1 num2)
    (list (+ (real num1) (real num2)) (+ (complex num1) (complex num2)))
)

'(test equal?)
(equal? '(2.5 3.7) '(2.5 3.7))
(equal? '(2.5 3.7) '(2.5 3.8))
(equal? '(2.4 3.7) '(2.5 3.7))

;minus - subtracts complex num1, num2
(define (minus num1 num2)
    (list (- (real num1) (real num2)) (- (complex num1) (complex num2)))
)

'(test minus)
(minus '(2.5 3.7) '(2.5 3.7))
(minus '(2.5 3.7) '(2.5 3.8))
(minus '(2.4 3.7) '(2.5 3.7))

;prod - multiplies complex num1, num2
(define (prod num1 num2)
    (list
        (- (* (real num1) (real num2)) (* (complex num1) (complex num2)))
        (+ (* (real num1) (real num2)) (* (complex num1) (complex num2)))
    )
)

'(test prod)
(prod '(2.5 3.7) '(2.5 3.7))
(prod '(2.5 3.7) '(2.5 3.8))
(prod '(2.4 3.7) '(2.5 3.7))

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

'(test quotient)
(quotient '(2.5 3.7) '(2.5 3.7))
(quotient '(2.5 3.7) '(2.5 3.8))
(quotient '(2.4 3.7) '(2.5 3.7))

;2) permutation detection

;import assign4 remove
;remove - takes list, atom, removes all top-level instances of atom from list
(define (remove lst atom)(cond
    ((null? lst) lst)
    ((eqv? (car lst) atom) (remove (cdr lst) atom))
    (else (cons (car lst) (remove (cdr lst) atom)))
))

;permutation - take list1, list2, return #t/#f if lists are permutations
(define (permutation list1 list2)(cond
    ((and (null? list1) (null? list2)) #t)
    ((= (length list1) (length list2)) (permutation (remove list1 (car list1)) (remove list2 (car list1))))
    (else #f)
))

'(test permutation)
(permutation '(1 2 3 4 5) '(5 4 3 2 1))
(permutation '(1 2 3 4 5 1) '(5 4 3 2 1 1))
(permutation '(1 2 3 4 5 2) '(5 4 3 2 1 1))

;3) binary tree operations

;tree is of the form (root, left leaf, right leaf)
;root is an atom, leaves can be either atoms or subtrees
;tree? - accepts list as argument, returns #t, #f if valid binary tree
(define (tree? lst)(cond
    ((not (list? lst)) #f)
    ((null? lst) #t)
    ((list? (car lst)) #f)
    ((=(length lst) 3) (and (tree? (cadr lst)) (tree? (caddr lst))))
    (else #f)
))

'(test tree?)
(tree? '(a (b () (c () ())) (d () (e (f () ()) ()))))
(tree? '(a (b () (c () ())) (d () (e (f ( ()) ())))))

;preorder - accepts tree, returns list of values based on pre-order traversal
;root, left, right
(define (preorder lst)(cond
    ((null? lst) lst)
    ((list? lst) (append
        (preorder (car lst))
        (preorder (cadr lst))
        (preorder (caddr lst))
    ))
    (else (list lst))
))

'(test preorder)
(preorder '(a (b () (c () ())) (d () (e (f () ()) ()))))

;inorder - accepts tree, returns list of values based on in-order traversal
;left, root, right
(define (inorder lst)(cond
    ((null? lst) lst)
    ((list? lst) (append
        (preorder (cadr lst))
        (preorder (car lst))
        (preorder (caddr lst))
    ))
    (else (list lst))
))

'(test inorder)
(inorder '(a (b () (c () ())) (d () (e (f () ()) ()))))

;postorder - accepts tree, returns list of values based on post-order traversal
;left, right, root
(define (postorder lst)(cond
    ((null? lst) lst)
    ((list? lst) (append
        (preorder (cadr lst))
        (preorder (caddr lst))
        (preorder (car lst))
    ))
    (else (list lst))
))

'(test postorder)
(postorder '(a (b () (c () ())) (d () (e (f () ()) ()))))