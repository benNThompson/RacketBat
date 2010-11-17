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

(run-checks my-add-tests ev)