#lang racket
(provide (all-defined-out))

;; check: any any integer
;; actual: function call of the student's function with certain arguments
;; expected: the value the function call should produce
;; point-value: the number of points this check is worth
(struct check
  (actual expected points)
  #:transparent)

;; check-suite: ([any any any] ...) -> list-of-check
;; consumes: a name for the group of checks
;; produces: nothing, but defines aName as a list of the checks
(define-syntax check-suite
  (syntax-rules ()
    ((_ (actualResult expectedResult pointValue) ...)
     (list (check (quote actualResult) expectedResult pointValue) ...))))

;; run-checks: list-of-checks evaluator -> void
;; consumes: a list of checks and an evaluator to run them against
;; produces: Displays the number passed and failed, and the points scored out of the possible points
(define-syntax run-checks
  (syntax-rules ()
    ((_ aSuite anEva)
     (let ([totalPoints 0]
           [numChecks (length aSuite)]
           [points 0]
           [passed 0]
           [name (symbol->string (quote aSuite))])
       (for ([c aSuite])
         (set! totalPoints (+ totalPoints (check-points c)))
         (when (equal? (anEva (check-actual c)) (anEva (check-expected c)))
           (set! points (+ points (check-points c)))
           (set! passed (+ passed 1))))
       (display (string-append name
                               "\n"
                               (build-string (string-length name) (lambda (i) #\-))
                               "\n"
                               "Passed/Failed: "
                               (number->string passed)
                               "/"
                               (number->string numChecks)
                               "\nPoints: "
                               (number->string points)
                               "/"
                               (number->string totalPoints)))))))