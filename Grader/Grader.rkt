#lang racket

(define in
  (open-input-file "Test"))

(define (reset)
  (set! in (open-input-file "Test")))