;; ReputationScore Clarity Contract
;; On-chain reputation tracking system.


(define-map scores principal uint)
(define-constant admin tx-sender)

(define-public (update-score (user principal) (score uint))
    (begin
        (asserts! (is-eq tx-sender admin) (err u401))
        (map-set scores user score)
        (ok true)
    )
)

(define-read-only (get-score (user principal))
    (ok (default-to u0 (map-get? scores user)))
)

