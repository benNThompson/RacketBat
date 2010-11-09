#lang racket

(define (add num1 num2)
  (+ num1 num2))

(define in (open-input-file "Test"))

(define-values (c i) (values 0 0))

(define (grade assignment)
  