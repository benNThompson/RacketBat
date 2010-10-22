#lang racket

(require "checker2/checker2.rkt")

;; ***************************************
;; THESE ARE MY SOLUTIONS TO THE EXERCISES
;; USED TO TEST AGAINST STUDENT SUBMISSION
(define (total-profit x)
  (- (* 5 x) (+ 20 (* .5 x))))

(define (course-grade asgn quiz ex1 ex2 ex3)
  (+ (* asgn .45) (* quiz 10/100) (* 45/100 (/ (+ ex1 ex2 ex3) 3))))

(define SEMESTERS-PER-YEAR 2)
(define CLASSES-PER-SEMESTER 5)
(define WEEKS-PER-SEMESTER 14)
(define LECTURES-PER-WEEK 3)
(define (cost-per-lecture total-tuition)
  (/ total-tuition 
     SEMESTERS-PER-YEAR CLASSES-PER-SEMESTER 
     WEEKS-PER-SEMESTER LECTURES-PER-WEEK))

(define (barometer-dir p1 p2)
  (cond
    [(< p1 p2) "rising"]
    [(> p1 p2) "falling"]
    [else "steady"]))
;; ***************************************
;; ***************************************


(define the-assignment
  (assignment "Homework 2"
              "hw2"
              '(htdp intermediate)
              (list
               (problem "2a. Movie Theater Profit"
                        "hw2-movie.rkt"
                        `(
                          (proc total-profit 1)
                          (type (total-profit 5) "a number" ,number?)
                          (test (total-profit 0) -20)
                          (test (total-profit 4) ,(total-profit 4))
                          (test (total-profit 10) ,(total-profit 10))
                          ))
               (problem "2b. Course Grade"
                        "hw2-coursegrade.rkt"
                        `(
                          (proc course-grade 5)
                          (type (course-grade 80 90 80 70 75)
                                "a number" ,number?)
                          (test (course-grade 80 90 80 70 75)
                                ,(course-grade 80 90 80 70 75))
                          (test (course-grade 50 85 100 70 75)
                                ,(course-grade 50 85 100 70 75))
                          (test (course-grade 100 100 100 100 100) 100)
                          ))
               (problem "2c. Pizza Share"
                        "hw2-pizzashare.rkt"
                        `(
                          (proc price-with-tip 1)
                          (proc share-with-tip 2)
                          (type (price-with-tip 10) "a number" ,number?)
                          (type (share-with-tip 10 2) "a number" ,number?)
                          (test (price-with-tip 10) 11.5)
                          (test (share-with-tip 10 2) 2.875)
                          (test (share-with-tip 10 1) 1.4375)
                          (test (share-pizza-cost 10 1) 1.25)
                          (test (share-pizza-cost 16 3) 6.00)
                          (test (share-pizza-cost 13 4) 6.50)
                          (test (share-pizza-cost 7 8) 7)
                          ))
               (problem "2d. Lecture Cost"
                        "hw2-lecturecost.rkt"
                        `(
                          (proc cost-per-lecture 1)
                          (type (cost-per-lecture 20000) "a number" ,number?)
                          (test (cost-per-lecture 20000)
                                ,(cost-per-lecture 20000))
                          (test (cost-per-lecture 24975)
                                ,(cost-per-lecture 24975))
                          (test (cost-per-lecture 24420)
                                ,(cost-per-lecture 24420))
                          ))
               (problem "2e. Barometer"
                        "hw2-barometer.rkt"
                        `(
                          (proc barometer-dir 2)
                          (type (barometer-dir 40 50) "a string" ,string?)
                          (test (barometer-dir 40 40)
                                ,(barometer-dir 40 40))
                          (test (barometer-dir 40 41)
                                ,(barometer-dir 40 41))
                          (test (barometer-dir 40 50)
                                ,(barometer-dir 40 50))
                          (test (barometer-dir 39 40)
                                ,(barometer-dir 39 40))
                          (test (barometer-dir 10 40)
                                ,(barometer-dir 10 40))
                          ))
               )))

(provide the-assignment)

