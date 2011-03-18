#lang racket
(require "Grader.rkt")
(require racket/sandbox)

(define ev (make-module-evaluator (string->path "StudentWorkPosn.rkt")
                                  #:allow-read (list (string->path "."))))

(define southeast-tests (make-check-suite
                         "Tests for SoutheastOf"
                         ((southeast-of? (make-posn 50 50) (make-posn 60 51)) false 1)
                         ((southeast-of? (make-posn 40 40) (make-posn 20 20)) true 1)
                         ((southeast-of? (make-posn 60 60) (make-posn 70 61)) false 1)
                         ((southeast-of? (make-posn 70 40) (make-posn 60 39)) true 1)
                         ((southeast-of? (make-posn 40 50) (make-posn 50 40)) false 1)
                         ((southeast-of? (make-posn 50 50) (make-posn 49 49)) true 1)))

(define which-direction-tests (make-check-suite
                               "Tests for which-direction-to"
                               ((which-direction-to (make-posn 50 50) (make-posn 50 50)) "youre there" 1)
                               ((which-direction-to (make-posn 50 50) (make-posn 60 60)) "southeast" 1)
                               ((which-direction-to (make-posn 50 50) (make-posn 40 40)) "northwest" 1)
                               ((which-direction-to (make-posn 50 50) (make-posn 50 40)) "north" 1)
                               ((which-direction-to (make-posn 60 60) (make-posn 60 70)) "south" 1)
                               ((which-direction-to (make-posn 50 50) (make-posn 60 40)) "northeast" 1)
                               ((which-direction-to (make-posn 60 50) (make-posn 50 70)) "southwest" 1)
                               ((which-direction-to (make-posn 85 85) (make-posn 100 85)) "east" 1)
                               ((which-direction-to (make-posn 73 73) (make-posn 52 73)) "west" 1)
                               ((which-direction-to (make-posn 195 195) (make-posn 195 195)) "youre there" 1)))

(define posn+-tests (make-check-suite
                     "Tests for posn+"
                     ((posn+ (make-posn 50 50) (make-posn 50 50)) (make-posn 100 100) 1)
                     ((posn+ (make-posn 50 60) (make-posn 50 40)) (make-posn 100 100) 1)
                     ((posn+ (make-posn 0 0) (make-posn 50 50)) (make-posn 50 50) 1)
                     ((posn+ (make-posn 20 50) (make-posn 50 50)) (make-posn 70 100) 1)))

;onimage? test (cannot do, need to RTFM)

(define distance-tests (make-check-suite
                        "Tests for distance"
                        ((distance (make-posn 50 50) (make-posn 50 50)) 0 1)
                        ((distance (make-posn 20 50) (make-posn 20 50)) 0 1)
                        ((distance (make-posn 5 5) (make-posn 15 7)) (sqrt 104) 1)
                        ((distance (make-posn 50 50) (make-posn 100 100)) (sqrt 5000) 1)
                        ((distance (make-posn 23 40) (make-posn 77 87)) (sqrt 5125) 1)
                        ((distance (make-posn 5 9) (make-posn 27 16)) (sqrt 533) 1)))


;(define my-add-tests (make-check-suite
;                      "Tests for my-add"
;                      ((my-add 1 2) 3 1)
;                      ((my-add 3 7) 10 1)
;                      ((my-add 10 -5) 5 2)
;                      ((my-add 1 0) 3 10)))


(run-suites ev southeast-tests distance-tests posn+-tests which-direction-tests
            )