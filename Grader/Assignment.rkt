#lang racket
(require "Grader.rkt")
(require racket/sandbox)

(define ev (make-module-evaluator (string->path "StudentWork.rkt")
                                  #:allow-read (list (string->path "."))))

(define my-add-tests (check-suite
                      ((my-add 1 2) 3 1)
                      ((my-add 3 7) 10 1)
                      ((my-add 10 -5) 5 2)
                      ((my-add 1 0) 3 10)))

(define mystery-tests (check-suite
                       ((mystery 1) 10 1)
                       ((mystery 2) 20 1)))

(run-suites my-add-tests mystery-tests ev)