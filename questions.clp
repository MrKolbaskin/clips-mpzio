(question 
	(category final)
	(text "Выйти? Y(y) - да, N(n) - нет.") 
	(values y n)
)

; Возможные вопросы:
; Ваши знания инвестиционных инструментов - отсутсвуют -> l, только начал -> l, средние -> m, глубокие -> h
; Ваша сумма инвестиций - <=300к -> low, <1m -> medium, >2m -> high
; Ожидаемый доход в процентах за год - <15% -> low, <30% -> medium, >30% - high
; Вопросы скорее всего удобнее сделать ответами из enum, а не цифрами

(question 
	(category payments)
	(text "Нужны ли стабильные выплаты? Y(y) - да, N(n) - нет.") 
	(values y n)
)

(question 
	(category knowledge)
	(text "Ваш опыт в инвестициях? 
	< 6 месяцев (l),  
	< 3 лет (m),
	> 3 лет (h)") 
	(values l m h)
)

(question 
	(category investmentAmount)
	(text "Ваша сумма инвестиций? 
	< 300 000 руб (l),  
	< 2 000 000 руб (m),
	> 2 000 000 руб (h)") 
	(values l m h)
)

(question 
	(category profit)
	(text "Ожидаемый доход в процентах? 
	< 15% (l),  
	< 30% (m)
	> 30% (h)") 
	(values l m h)
)

(question 
	(category tax)
	(text "Нормально ли вы относитесь к инструментам, которые еще не регулируются законом? 
	Да (y),  
	Нет (n)") 
	(values y n )
)

(question 
	(category payments)
	(text "Важны ли вам регулярные выплаты? 
	Да (y),  
	Нет (n)") 
	(values y n )
)

(question 
	(category risk)
	(text "Рассмотрите такой сценарий: 
	Представьте, что в течение последних трех месяцев рынки акций 
	упали на 25%. Одна из акций в Вашем портфеле потеряла 20% своей 
	стоимости. Какие Ваши действия? 
	Продам все мои акции (l),  
	Продам часть акций (m),
	Докуплю акции (h)") 
	(values l m h)
)

(question 
	(category ownershipForeign)
	(text "Готовы ли вы инвестировать в иностранные активы? 
	Да (y),  
	Нет (n)") 
	(values y n )
)

(question 
	(category ownershipGovernment)
	(text "Какой вид актива вы предочли бы? 
	Государственный (1),  
	Частный (2),
	Неважно (3)") 
	(values 1 2 3)
)

