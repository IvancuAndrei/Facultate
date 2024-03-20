;a)
; cmmmc(a,b) = { False/ NIL, daca a si b nu sunt numere
;              b, daca a nu este numar
;              a, daca b nu este numar
;              a * b / cmmdc(a, b)


(defun _cmmmc (a b)
    (cond
        ((and (not (numberp a)) (not (numberp b))) nil)
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        (T (/ (* a b) (_cmmdc a b)))
    )
)


; cmmdc(a,b) = {  False/ NIL, daca a si b nu sunt numere
;               b, daca a nu este numar
;               a, daca b nu este numar sau este egal cu 0
;               cmmdc(b, a mod b) altfel 
 
(defun _cmmdc (a b)
    (cond
        ((and (not (numberp a)) (not (numberp b))) nil)
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        ((equal b 0) a)
        (T (_cmmdc b (mod a b)))
    )
)

;list_cmmmc(L) = { l1, daca L are un singur element
;                  cmmmc (list_cmmmc(l1), list_cmmmc(l2...ln)) daca l1 este o lista
;                  cmmmc (l1, list_cmmmc(l2...ln)) daca l1 este un numar

(defun list_cmmmc (l)
    (cond
        ((and (atom (car l)) (null (cdr l))) (car l))
        ((listp (car l)) (_cmmmc (list_cmmmc (car l)) (list_cmmmc (cdr l))))
        (T (_cmmmc (car l) (list_cmmmc (cdr l))))
    )
)

(print (list_cmmmc '(24 ( 16 (12 A B)) 72)))
;=> 144



;b)

;_mountain(L, decreasing) = { T, daca lungimea listei = 1 si decreasing = False
;                             F, daca l1 < l2 si decreasing = False
;                             _mountain(l2...ln, nil), daca l1 > l2
;                             _mountain(l2...ln, decreasing)

(defun _mountain (l decreasing)
	(cond
		((= (list-length l) 1) (if decreasing nil T))
		((and (< (car l) (cadr l)) (not decreasing)) nil)
		((and (> (car l) (cadr l)) decreasing) (_mountain (cdr l) nil))
		(T (_mountain (cdr l) decreasing))
	)
)


; mountain(l) = {  False, daca lungime < 3
;                  _mountain(l) altfel
(defun mountain (l)
	(if (< (list-length l) 3)
		nil
		(_mountain l T)
	)
)

(print (mountain '(10 18 29 17 11 10)))
; => T

(print (mountain '(10 18 29 17 11 29 10)))
;=> nil

(print (mountain '(5 4 3)))
;=> nil


; c) 

; max_nb(a,b) = { a daca a > b
;                 b altfel
(defun max_nb (a b)
    (if (> a b) a b)
)


; max_num(L) = { -1 , daca L este vida
;                l1, daca lungimea lui L este 1
;                max_nb(l1, max_num(l2...ln)) daca l1 este un numar
;                max_nb(max_num(l1), max_num(l2...ln)) daca l1 este o sublista
;                max_num(l2...ln) daca l1 este atom

(defun max_num (l)
    (cond
        ((null l) -1)
        ((and (null (cdr l)) (numberp (car l))) (car l))
        ((numberp (car l)) (max_nb (car l) (max_num (cdr l))))
        ((listp (car l)) (max_nb (max_num (car l)) (max_num (cdr l))))
        (t (max_num (cdr l)))
     )
)

(print (max_num '(1 2 (3 (a) (1 3)) 4 5)))
; => 5

;


; d)

;produsL(L) = { L, daca L este un numar
;                1, daca L este un atom
;                multiply-list-elements(L), daca L este o lista

(defun produsL (l)
  (cond
    ((numberp l) l)
    ((atom l) 1)
    (T (multiply-list-elements l))
  )
)


; multiply-list-elements(L) = { 1, daca lista e vida
;                               l1 * multiply-list-elements(l2...ln)

(defun multiply-list-elements (lst)
  (if (null lst)
      1
      (* (produsL(car lst)) (multiply-list-elements (cdr lst))))
)

(print (produsL
         '(1 2 3 (4 5 (6)) (7))))
;=> 5040