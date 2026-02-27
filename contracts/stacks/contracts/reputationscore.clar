;; ────────────────────────────────────────
;; ReputationScore v1.0.0
;; Author: solidworkssa
;; License: MIT
;; ────────────────────────────────────────

(define-constant VERSION "1.0.0")

;; Error codes
(define-constant ERR-NOT-AUTHORIZED (err u401))
(define-constant ERR-NOT-FOUND (err u404))
(define-constant ERR-ALREADY-EXISTS (err u409))
(define-constant ERR-INVALID-INPUT (err u422))

;; ReputationScore Clarity Contract
;; On-chain reputation tracking system.


(define-map scores principal uint)
(define-constant admin contract-caller)

(define-public (update-score (user principal) (score uint))
    (begin
        (asserts! (is-eq contract-caller admin) (err u401))
        (map-set scores user score)
        (ok true)
    )
)

(define-read-only (get-score (user principal))
    (ok (default-to u0 (map-get? scores user)))
)

