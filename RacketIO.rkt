#lang racket
(require racket/tcp)

;;OUT

;(define-values (in out) (tcp-connect "localhost" 2000))

;(display "Hello there\n" out)

;(close-output-port out)
;(close-input-port in)

;;IN

(define lstnr (tcp-listen 2000))
(define-values (in out) (tcp-accept lstnr))

(for ([line (in-lines in)])
  (display line))

(close-input-port in)
(close-output-port out)
(tcp-close lstnr)