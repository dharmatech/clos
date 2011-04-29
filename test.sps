
(import (rnrs)
        (clos user)
        (clos core))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(let ()

  (define-class <point> () x y)

  (define-method initialize 'after ((point <point>) init-args)
    (initialize-direct-slots point <point> init-args))

  ;; (define-method initialize 'after ((point <point>) init-args)
  ;;   (initialize-direct-slots point
  ;;                            <point>
  ;;                            (append init-args '(x 0 y 0))
  ;;                            ))

  (define-method print-object ((point <point>) port)
    (print-object-with-slots point port))

  (define-generic norm)

  (define-method norm ((point <point>))
    (sqrt (+ (expt (slot-ref point 'x) 2)
             (expt (slot-ref point 'y) 2))))

  (define p0 (make <point> 'x 3 'y 4))

  (assert (= (slot-ref p0 'x) 3))

  (assert (= (norm p0) 5)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(let ((<point> (make <class>
                 'definition-name '<point>
                 'direct-supers (list <object>)
                 'direct-slots '(x y))))

  (let ((p0 (make <point>)))

    (slot-set! p0 'x 1)

    (assert (= (slot-ref p0 'x) 1))))

