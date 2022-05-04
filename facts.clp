(defrule Stock
    (risk m) ; high -> h, medium -> m, low -> l
    (profit h) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity m) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (ownership p) ; government -> g, private -> p, f -> foreign
    (payments y) ; yes -> y, no -> n
	=>
	(printout t "Stock - бла бла" crlf)
	(assert (end))
)

(defrule Deposit
    (risk l) ; high -> h, medium -> m, low -> l
    (profit l) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity l) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (or
        (ownership p)
        (ownership f)
    )
    (payments y) ; yes -> y, no -> n
	=>
	(printout t "Deposit - бла бла" crlf)
	(assert (end))
)

(defrule Bond
    (risk l) ; high -> h, medium -> m, low -> l
    (profit l) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity l) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (or
        (ownership p)
        (ownership f)
        (ownership g)
    )
    (payments y) ; yes -> y, no -> n
	=>
	(printout t "Bond - бла бла" crlf)
	(assert (end))
)

(defrule Currency
    (risk l) ; high -> h, medium -> m, low -> l
    (profit l) ; high -> h, medium -> m, low -> l
    (tax n) ; yes -> y, no -> n
    (complexity l) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (or
        (ownership f)
        (ownership g)
    )
    (payments n) ; yes -> y, no -> n
	=>
	(printout t "Currency - бла бла" crlf)
	(assert (end))
)

(defrule Futures
    (risk h) ; high -> h, medium -> m, low -> l
    (profit h) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity h) ; high -> h, medium -> m, low -> l
    (entryThreshold m) ; high -> h, medium -> m, low -> l
    (or
        (ownership f)
        (ownership g)
        (ownership p)
    )
    (payments n) ; yes -> y, no -> n
	=>
	(printout t "Currency - бла бла" crlf)
	(assert (end))
)

(defrule Realty
    (risk l) ; high -> h, medium -> m, low -> l
    (profit m) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity m) ; high -> h, medium -> m, low -> l
    (entryThreshold h) ; high -> h, medium -> m, low -> l
    (ownership p)
    (payments y) ; yes -> y, no -> n
	=>
	(printout t "Realty - бла бла" crlf)
	(assert (end))
)

(defrule Crypto
    (risk h) ; high -> h, medium -> m, low -> l
    (profit h) ; high -> h, medium -> m, low -> l
    (tax n) ; yes -> y, no -> n
    (complexity h) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (ownership p)
    (payments n) ; yes -> y, no -> n
	=>
	(printout t "Crypto - бла бла" crlf)
	(assert (end))
)

(defrule PreciousMetals
    (risk l) ; high -> h, medium -> m, low -> l
    (profit l) ; high -> h, medium -> m, low -> l
    (tax n) ; yes -> y, no -> n
    (complexity l) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (payments n) ; yes -> y, no -> n
	=>
	(printout t "Precious Metals - бла бла" crlf)
	(assert (end))
)

(defrule Fund
    (risk l) ; high -> h, medium -> m, low -> l
    (profit l) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity l) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (payments y) ; yes -> y, no -> n
	=>
	(printout t "Fund - бла бла" crlf)
	(assert (end))
)

; Возможные вопросы:
; Ваши знания инвестиционных инструментов - отсутсвуют -> l, только начал -> l, средние -> m, глубокие -> h
; Ваша сумма инвестиций - <=300к -> low, <1m -> medium, >2m -> high
; Ожидаемый доход в процентах за год - <15% -> low, <30% -> medium, >30% - high
; Нужны ли стабильные выплаты - да, нет
