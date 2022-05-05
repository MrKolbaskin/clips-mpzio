(deftemplate question
	(slot category (type SYMBOL) (default ?NONE))
	(slot text (type STRING) (default ?NONE))
	(multislot values (type SYMBOL) (default ?NONE))
)

(deffunction clear-window ()
	(loop-for-count (?cnt 0 50) do
        (printout t crlf)))

(deffunction ask-question (?question)
	(printout t (fact-slot-value ?question text) crlf)
	(printout t "Ответ: ")
	(bind ?answer (read))
	(if (lexemep ?answer) 
		then (bind ?answer (lowcase ?answer)))
	(if (eq ?answer break) 
		then (assert (break)))
	(while (and (not (member ?answer (fact-slot-value ?question values))) (not (eq ?answer break))) do
		(printout t "Ответ: ")
		(bind ?answer (read))
		(if (lexemep ?answer)
			then (bind ?answer (lowcase ?answer)))
		(if (eq ?answer break) 
			then (assert (break))))
	(printout t crlf)
	?answer
)

(deffunction start ()
	(reset)
	(load-facts questions_utf8.clp)
	(clear-window)
)
	
	
(deffunction main ()
	(load rules_utf8.clp)
	(clear-window)
	(printout t "Рекомендательная система по инвестиционным активам на базе языка CLIPS" crlf "Авторы: 
	Дубинин В.Д.
	Яндутов А.В.
При ответе введите 'break', если Вам надоест.")
	(readline)
	(bind ?answer "")
	(while TRUE
		(start)
		(run)
		(printout t crlf "***НАЖМИТЕ ENTER***" crlf)
		(readline)
		(if (eq (ask-question (nth 1 (find-fact ((?p question)) (eq ?p:category final)))) y) then
			(printout t "Всего доброго :)" crlf)
			(readline)
			(exit 0)
		)
	)
)

(defrule break 
	(declare (salience 150))
	(break)
	=>
	(if (eq (ask-question (nth 1 (find-fact ((?p question)) (eq ?p:category final)))) y) then
		(printout t "Всего доброго :)" crlf)
		(readline)
		(exit 0)
	)
	(start)
)