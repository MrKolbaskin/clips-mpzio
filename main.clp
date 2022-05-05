(deftemplate question
  (slot category (type SYMBOL) (default ?NONE))
  (slot text (type STRING) (default ?NONE))
  (multislot values (type INTEGER) (default 0))
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
		(printout t "Enter your answer$: ")
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
	(printout t "-- In start func --" crlf)
	(load-facts questions.clp)
	(printout t "-- In then end of start func --" crlf)
)
	
	
(deffunction main()
	(load_rules_and_data)
	(printout t "Введите 'stop' чтобы остановить программу" crlf)
	(while TRUE
		(start)
		(run)
		(if (eq (ask_question (nth$ 1 (find-fact ((?p question)) (eq ?p:category final)))) 1) then
			(printout t "Завершено!" crlf)
			(readline)
			(exit 0)
		)
	)
)