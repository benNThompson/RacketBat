#lang racket
(require "Grader.rkt")
(require racket/sandbox)
(require htdp/image)

(define ev (make-module-evaluator (string->path "StudentWork.rkt")
                                  #:allow-read (list (string->path "."))))

(define my-add-tests (make-check-suite
                      "Tests for my-add"
                      ((my-add 1 2) 3 1)
                      ((my-add 3 7) 10 1)
                      ((my-add 10 -5) 5 2)
                      ((my-add 1 0) 3 10)))

(define mystery-tests (make-check-suite
                       "Tests for mystery"
                       ((mystery 1) 10 1)
                       ((mystery 2) 20 1)))

(define circ-tests (make-check-suite
                    "Tests to see if images work"
                    ((circle 10 'solid 'blue) (circle 10 'solid 'blue) 1)
                    ((circle 20 'solid 'red) (circle 1 'outline 'green) 1)))

(run-suites ev my-add-tests mystery-tests circ-tests)