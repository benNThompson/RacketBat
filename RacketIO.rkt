#lang racket
(require racket/tcp)

;In
(define lstnr (tcp-listen 2000))
(define-values (in out) (tcp-accept lstnr))

(for ([line (in-lines in)])
  (display (string-append line "\n")))

(close-input-port in)
(close-output-port out)
(tcp-close lstnr)

;Out
(sleep .5)
(set!-values (in out)
             (tcp-connect "localhost" 2001))

(display "Yep," out)
(display "it worked." out)
(display "Huzzah!" out)

(close-input-port in)
(close-output-port out)