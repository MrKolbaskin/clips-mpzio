(defrule stop
    (declare (salience 150))
    (stop)
    =>
    (if (eq (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category final)))) y) then
        (printout t "До встречи!" crlf)
        (readline)
        (exit)
    else (start)
    )
)

;;;;;;;;;;;;;;;;;;;;;;

(defrule knowledge_question
    (not (knowledge_value ?))
    =>
    (assert (knowledge_value (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category knowledge))))))
)

(defrule knowledge_value_l
    (knowledge_value l)
    =>
    (assert (complexity l))
    (assert (risk l))
    (assert (profit l))
)

(defrule knowledge_value_m
    (knowledge_value m)
    =>
    (assert (complexity m))
    (assert (complexity l))
)

(defrule knowledge_value_h
    (knowledge_value h)
    =>
    (assert (complexity m))
    (assert (complexity l))
    (assert (complexity h))
)

;;;;;;;;;;;;;;;;;;;;;;

(defrule investmentAmount_question
    (not (investmentAmount ?))
    =>
    (assert (investmentAmount (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category investmentAmount))))))
)

(defrule investmentAmount_value_l
    (investmentAmount l)
    =>
    (assert (entryThreshold l))
)

(defrule investmentAmount_value_m
    (investmentAmount m)
    =>
    (assert (entryThreshold l))
    (assert (entryThreshold m))
)

(defrule investmentAmount_value_h
    (investmentAmount h)
    =>
    (assert (entryThreshold l))
    (assert (entryThreshold m))
    (assert (entryThreshold h))
)

;;;;;;;;;;;;;;;;;;;;;;

(defrule risk_question
    (not (risk_value ?))
    (not (risk ?))
    =>
    (assert (risk_value (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category risk))))))
)

(defrule risk_value_l
    (risk_value l)
    =>
    (assert (risk l))
)

(defrule risk_value_m
    (risk_value m)
    =>
    (assert (risk l))
    (assert (risk m))
)

(defrule risk_value_h
    (risk_value h)
    =>
    (assert (risk l))
    (assert (risk m))
    (assert (risk h))
)

(defrule risk_thr_value_l
    (and
        (risk l)
        (not (risk m))
        (not (entryThreshold h))    
    )
    =>
    (assert (profit l))
)

;;;;;;;;;;;;;;;;;;;;;;

(defrule profit_question
    (and
        (not (profit_value ?))
        (not (profit ?))
    )
    =>
    (assert (profit_value (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category profit))))))
)

(defrule profit_value_l
    (profit_value l)
    =>
    (assert (profit l))
)

(defrule profit_value_m
    (profit_value m)
    =>
    (assert (profit l))
    (assert (profit m))
)

(defrule profit_value_h
    (profit_value h)
    =>
    (assert (profit h))
    (assert (ownership p))
    (assert (payments n))
)

;;;;;;;;;;;;;;;;;;;;;;

(defrule payments_question
    (not (payments_value ?))
    (not (payments ?))
    =>
    (assert (payments_value (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category payments))))))
)

(defrule payments_value_y
    (payments_value y)
    =>
    (assert (payments y))
)

(defrule payments_value_n
    (payments_value n)
    =>
    (assert (payments n))
    (assert (payments y))
)


;;;;;;;;;;;;;;;;;;;;;;

(defrule ownership_foreign_question
    (and
        (not (ownership_foreign_value ?))
        (not (ownership f))
    )
    =>
    (assert (ownership_foreign_value (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category ownershipForeign))))))
)

(defrule ownership_foreign_value_y
    (ownership_foreign_value y)
    =>
    (assert (ownership f))
)

(defrule ownership_gov_question
    (and
        (not (ownership_gov_value ?))
        (not (ownership g))
        (not (ownership p))
    )
    =>
    (assert (ownership_gov_value (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category ownershipGovernment))))))
)

(defrule ownership_gov_value_a
    (ownership_gov_value a)
    =>
    (assert (ownership g))
    (assert (tax y))
)

(defrule ownership_gov_value_b
    (ownership_gov_value b)
    =>
    (assert (ownership p))
)

(defrule ownership_gov_value_c
    (ownership_gov_value c)
    =>
    (assert (ownership p))
    (assert (ownership g))
)

;;;;;;;;;;;;;;;;;;;;;;

(defrule tax_question
    (not (tax_value ?))
    (not (tax ?))
    =>
    (assert (tax_value (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category tax))))))
)

(defrule tax_value_y
    (tax_value y)
    =>
    (assert (tax n))
)

(defrule tax_value_n
    (tax_value n)
    =>
    (assert (tax n))
    (assert (tax y))
)

;;;;;;;;;;;;;;;;;;;;;;

(defrule default
    (declare (salience -300))
    (not (exists (final)))
    =>
    (printout t "К сожалению по введенным вами параметрам не удалось найти инвестиционный актив." crlf)
)
