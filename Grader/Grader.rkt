#lang racket
(provide (all-defined-out))

;; check: any any integer
;; actual: function call of the student's function with certain arguments
;; expected: the value the function call should produce
;; point-value: the number of points this check is worth
(struct check
  (actual expected points)
  #:transparent)

;; suite: string list-of-check
;; name: the name to display when running the suite
;; checks: the checks that make up the suite
(struct suite
  (name checks)
  #:transparent)

;; make-check-suite: string (any any any) ... -> suite
;; consumes: a name and the bones of several checks
;; produces: a suite with the given name and checks
(define-syntax make-check-suite
  (syntax-rules ()
    ((_ aName (actualResult expectedResult pointValue) ...)
     (suite aName (list (check (quote actualResult) expectedResult pointValue) ...)))))

;; 

;; run-suite: suite evaluator -> void
;; consumes: a suite and an evaluator to run it against
;; produces: displays the number passed and failed, and the points scored out of the possible points
(define-syntax run-suite
  (syntax-rules ()
    ((_ anEva aSuite)
     (let ([totalPoints 0]
           [numChecks (length (suite-checks aSuite))]
           [points 0]
           [passed 0]
           [currentTest 0]
           [failMessage ""])
       (for ([c (suite-checks aSuite)])
         (set! totalPoints (+ totalPoints (check-points c)))
         (set! currentTest (+ currentTest 1))
         (if (equal? (anEva (check-actual c)) (anEva (check-expected c)))
           (begin (set! points (+ points (check-points c)))
                  (set! passed (+ passed 1)))
           (set! failMessage
                 (string-append failMessage
                                (format "Check #~a\nFunction Call: ~a\nExpected: ~a\nActual: ~a\n"
                                        currentTest
                                        (check-actual c)
                                        (check-expected c)
                                        (anEva (check-actual c)))))))
       (display (string-append (suite-name aSuite)
                               "\n"
                               (build-string (string-length (suite-name aSuite)) (lambda (i) #\-))
                               "\n"
                               "Passed/Total: "
                               (number->string passed)
                               "/"
                               (number->string numChecks)
                               "\nPoints: "
                               (number->string points)
                               "/"
                               (number->string totalPoints)
                               "\n\n"
                               failMessage
                               "\n"))))))

;; run-suites: list-of-check ... evaluator -> void
;; consumes: multiple check suites
;; produces: runs them all and prints the results
(define-syntax run-suites
  (syntax-rules ()
    ((_ anEva aSuite ...)
     (for-each (lambda (s) (run-suite anEva s))
               (list aSuite ...)))))