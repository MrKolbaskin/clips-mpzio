(defrule stop
    (declare (salience 150))
    (stop)
    =>
    (if (eq (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category final)))) 1) then
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
    (knowledge_value 1)
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
    (not (entryThreshold ?))
    =>
    (assert (entryThreshold (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category investmentAmount))))))
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
    (assert (risk m))
)

(defrule risk_value_h
    (risk_value h)
    =>
    (assert (risk m))
    (assert (risk h))
)

(defrule risk_thr_value_l
    (risk l)
    (not (entryThreshold h))
    =>
    (assert (profit l))
)

;;;;;;;;;;;;;;;;;;;;;;

(defrule profit_question
    (not (profit_value ?))
    (not (profit ?))
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
    (assert (profit m))
    (assert (ownership p))
    (assert (payments y))
    (assert (tax y))
)

(defrule profit_value_h
    (profit_value h)
    =>
    (assert (profit h))
    (assert (ownership p))
)

;;;;;;;;;;;;;;;;;;;;;;

(defrule payments_question
    (not (payments ?))
    =>
    (assert (payments (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category payments))))))
)

;;;;;;;;;;;;;;;;;;;;;;

(defrule ownership_foreign_question
    (not (ownership_foreign_value ?))
    (not (ownership f))
    =>
    (assert (ownership_foreign_value (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category ownershipForeign))))))
)

(defrule ownership_foreign_value_y
    (ownership_foreign_value y)
    =>
    (assert (ownership f))
)

(defrule ownership_gov_question
    (not (ownership_gov_value ?))
    (not (ownership g))
    (not (ownership p))
    =>
    (assert (ownership_gov_value (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category ownershipGovernment))))))
)

(defrule ownership_gov_value_1
    (ownership_gov_value 1)
    =>
    (assert (ownership g))
    (assert (tax y))
)

(defrule ownership_gov_value_2
    (ownership_gov_value 2)
    =>
    (assert (ownership p))
)

(defrule ownership_gov_value_3
    (ownership_gov_value 3)
    =>
    (assert (ownership p))
    (assert (ownership g))
)

;;;;;;;;;;;;;;;;;;;;;;

(defrule tax_question
    (not (tax ?))
    =>
    (assert (tax (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category tax))))))
)

;;;;;;;;;;;;;;;;;;;;;;

(defrule default
    (declare (salience -300))
    (not (exists (final)))
    =>
    (printout t "К сожалению по введенным вами параметрам не удалось найти инвестиционный актив." crlf)
)
