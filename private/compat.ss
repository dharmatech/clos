
(library (clos private compat)
  
  (export every-2
          append-map
          last
          get-arg
          position
          make-parameter
          pointer-value)

  (import (rnrs)
          (only (surfage s1 lists) append-map last)
          (surfage s39 parameters))

  ;; enough
  (define (pointer-value obj)
    obj)

  (define (position obj lst)
    (let loop ((lst lst) (idx 0) (obj obj))
      (cond 
        ((null? lst)
         #f)
        ((eq? (car lst) obj)
         idx)
        (else
         (loop (cdr lst) (+ idx 1) obj)))))

  (define (every-2 pred lst1 lst2)
    (let loop ((pred pred) (lst1 lst1) (lst2 lst2))
      (or (null? lst1)
          (null? lst2)
          (and (pred (car lst1) (car lst2))
               (loop pred (cdr lst1) (cdr lst2))))))

  (define (get-arg key lst . def)
    (let ((probe (member key lst)))
      (if (or (not probe)
              (not (pair? (cdr probe))))
          (if (pair? def)
              (car def)
              (error 'get-arg
                     (string-append "mandatory keyword argument "
                                    key
                                    " missing in "
                                    lst)))
          (cadr probe))))
  
  ) ;; library (clos private compat)
