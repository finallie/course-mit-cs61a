(define (make-even t) 
    (define (odd-to-even x) 
        (if (odd? x) (+ x 1) x))
    (tree (odd-to-even (label t)) (map make-even (branches t)))
)

(define (any? p lst) 
    (cond ((null? lst) #f)
          ((p (car lst)) #t)
          (else (any? p (cdr lst))))
)
(define (all? p lst)
    (cond ((null? lst) #t)
          ((p (car lst)) (all? p (cdr lst)))
          (else #f))
)

(define (find t x) 
   (or (eq? (label t) x)
       (any? (lambda (b) (find b x)) (branches t))
   )
)

(define (n-ary t n) 
(or (is-leaf t)
 (and (= (length (branches t)) n)
      (all? (lambda (b) (n-ary b n)) (branches t))
 )
))
