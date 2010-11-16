#lang racket
(require "Grader.rkt")
(require racket/sandbox)

(define ev (make-module-evaluator (string->path "StudentWork")))

(check-suite my-add-tests
                 ((my-add 1 2) 3 1)
                 ((my-add 3 7) 10 1)
                 ((my-add 10 -5) 5 2))

