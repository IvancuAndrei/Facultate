(defun explore (x node level children l)
        (cond
            ((eq x node) level)
            ((null l) nil)
            ((= children 0) l)
            (t 
                (setq new (explore x (car l) (+ level 1) (cadr l) (cddr l)))
                (cond 
                    ((listp new) (explore x node level (- children 1) new))
                    (t new)
                )
            )
        )
)

(defun solve (x l)
    (explore x (car l) 0 (cadr l) (cddr l))  
)

(print (solve 'A(list 'A 2 'B 1 'H 1 'I 1 'J 0 'C 2 'D 2 'F 1 'K 0 'G 0 'E 0 )))
