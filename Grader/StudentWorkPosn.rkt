;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname StudentWorkPosn) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require htdp/image)

;; southeast-of?: posn posn -> boolean
;; determines if the second posn is southeast of the first
(define (southeast-of? posn1 posn2)
  (and (< (posn-x posn2) (posn-x posn1))
       (< (posn-y posn2) (posn-y posn1))))