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


(defrule default
    (declare (salience -300))
    (not (exists (final)))
    =>
    (printout t "К сожалению по введенным вами параметрам не удалось найти инвестиционный актив." crlf)
)
