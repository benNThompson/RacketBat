#lang racket
(require racket/tcp)

;;OUT

(define-values (in out) (tcp-connect "localhost" 2000))

(display "Hello there\n" out)

(close-output-port out)
(close-input-port in)

;;IN

;(define lstnr (tcp-listen 2000))
;(define-values (in out) (tcp-accept lstnr))
;
;(for ([line (in-lines in)])
;  (display (string-append line "\n")))
;
;;(display "Yep," out)
;;(display "it worked." out)
;;(display "Huzzah!" out)
;
;(close-input-port in)
;(close-output-port out)
;(tcp-close lstnr)