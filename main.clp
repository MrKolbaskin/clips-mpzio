(deftemplate question
  (slot category (type SYMBOL) (default ?NONE))
  (slot text (type STRING) (default ?NONE))
  (multislot values (type SYMBOL) (default ?NONE))
)

(deffunction ask_question(?question)
	(printout t (fact-slot-value ?question text) crlf)
	(printout t "Введите ответ: ")
	(bind ?answer (read))
	(if (lexemep ?answer) 
		then (bind ?answer (lowcase ?answer)))
	(if (eq ?answer stop) 
		then (assert (stop)))
	(while (and (not (member$ ?answer (fact-slot-value ?question values))) (not (eq ?answer stop))) do
		(printout t "Введите ответ: ")
		(bind ?answer (read))
		(if (lexemep ?answer)
			then (bind ?answer (lowcase ?answer)))
		(if (eq ?answer stop) 
			then (assert (stop))))
	(printout t crlf)
	?answer
)


(deffunction load_rules_and_data()
	(load rules.clp)
	(load data.clp)
)

(deffunction start()
	(reset)
	(load-facts questions.clp)
)
	
	
(deffunction main()
	(load_rules_and_data)
	(printout t crlf)
	(printout t "----- Введите 'stop' чтобы остановить программу -----" crlf)
	(printout t crlf)
	(while TRUE
		(start)
		(run)
		(if (eq (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category final)))) y) then
			(printout t "До встречи!" crlf)
			(readline)
			(exit 0)
		)
	)
)