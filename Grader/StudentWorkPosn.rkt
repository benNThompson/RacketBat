;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname StudentWorkPosn) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require htdp/image)

;; southeast-of?: posn posn -> boolean
;; determines if the second posn is southeast of the first
(define (southeast-of? posn1 posn2)
  (and (> (posn-x posn2) (posn-x posn1))
       (> (posn-y posn2) (posn-y posn1))))

(define (ne posn1 posn2)
  (and (> (posn-x posn2) (posn-x posn1))
       (< (posn-y posn2) (posn-y posn1))))
(define (n posn1 posn2)
  (and (= (posn-x posn2) (posn-x posn1))
       (< (posn-y posn2) (posn-y posn1))))
(define (s posn1 posn2)
  (and (= (posn-x posn2) (posn-x posn1))
       (> (posn-y posn2) (posn-y posn1))))
(define (nw posn1 posn2)
  (and (< (posn-x posn2) (posn-x posn1))
       (< (posn-y posn2) (posn-y posn1))))
(define (sw posn1 posn2)
  (and (< (posn-x posn2) (posn-x posn1))
       (> (posn-y posn2) (posn-y posn1))))
(define (east posn1 posn2)
  (and (> (posn-x posn2) (posn-x posn1))
       (= (posn-y posn2) (posn-y posn1))))
(define (w posn1 posn2)
  (and (< (posn-x posn2) (posn-x posn1))
       (= (posn-y posn2) (posn-y posn1))))

;; which-direction-to: posn posn -> string
;; tells you which direction to go from the first posn to the second
(define (which-direction-to posn1 posn2)
  (cond
    [(southeast-of? posn1 posn2) "southeast"]
    [(ne posn1 posn2) "northeast"]
    [(n posn1 posn2) "north"]
    [(s posn1 posn2) "south"]
    [(nw posn1 posn2) "northwest"]
    [(sw posn1 posn2) "southwest"]
    [(east posn1 posn2) "east"]
    [(w posn1 posn2) "west"]
    [else "youre there"]))

;; posn+: posn posn -> posn
;; adds the x coordinates and the y coordinates together
(define (posn+ posn1 posn2)
  (make-posn (+ (posn-x posn1) (posn-x posn2)) (+ (posn-y posn1) (posn-y posn2))))

;; distance: posn posn -> number
;; tells the distance between two posns
(define (distance posn1 posn2)
  (sqrt (+ (expt (- (posn-x posn2) (posn-x posn1)) 2)
           (expt (- (posn-y posn2) (posn-y posn1)) 2))))

;; my-add
(define (my-add n1 n2)
  (+ n1 n2))


(check-expect (which-direction-to (make-posn 50 50) (make-posn 50 50)) "youre there")
(check-expect (which-direction-to (make-posn 50 50) (make-posn 60 60)) "southeast")
(check-expect (which-direction-to (make-posn 50 50) (make-posn 40 40)) "northwest")
(check-expect (which-direction-to (make-posn 50 50) (make-posn 50 40)) "north")
(check-expect (which-direction-to (make-posn 60 60) (make-posn 60 70)) "south")
(check-expect (which-direction-to (make-posn 50 50) (make-posn 60 40)) "northeast")
(check-expect (which-direction-to (make-posn 60 50) (make-posn 50 70)) "southwest")
(check-expect (which-direction-to (make-posn 85 85) (make-posn 100 85)) "east")
(check-expect (which-direction-to (make-posn 73 73) (make-posn 52 73)) "west")
(check-expect (which-direction-to (make-posn 195 195) (make-posn 195 195)) "youre there")

(check-expect (posn+ (make-posn 10 10) (make-posn 20 20)) (make-posn 30 30))

(check-expect (distance (make-posn 50 50) (make-posn 50 50)) 0)