#lang racket

(define in
  (open-input-file "StudentWork"))

(define (reset)
  (set! in (open-input-file "StudentWork")))

;; check: any any integer
;; actual: function call of the student's function with certain arguments
;; expected: the value the function call should produce
;; point-value: the number of points this check is worth
(struct check
  (actual expected point-value)
  #:transparent)

;; function-test: symbol list-of-check
;; name: the name of this group of checks, usually the name of the tested function
;; checks: a list of the checks to apply to the function
(struct function-test
  (name checks)
  #:transparent)

;; func-checks: symbol (any any integer) ... -> function-test
;; aName: a symbol which is the name for the group of checks
;; (actualResult expectedResult pointValue) ...: the components of the checks for the function
(define-syntax func-checks
  (syntax-rules ()
    ((func-checks aName (actualResult expectedResult pointValue) ...)
     (function-test aName (list (check actualResult expectedResult pointValue) ...)))))