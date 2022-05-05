(defrule RussianStock
    (risk m) ; high -> h, medium -> m, low -> l
    (profit h) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity m) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (ownership p) ; government -> g, private -> p, f -> foreign
    (payments n) ; yes -> y, no -> n
	=>
	(printout t "Акции российских компаний. 
    Например: Яндекс, VK, OZON." crlf)
	(assert (final))
)

(defrule DividendRussianStock
    (risk m) ; high -> h, medium -> m, low -> l
    (profit h) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity m) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (ownership p) ; government -> g, private -> p, f -> foreign
    (payments y) ; yes -> y, no -> n
	=>
	(printout t "Дивидендные акции российских компаний. 
    Например: Сбер, Лукойл, Норникель." crlf)
	(assert (final))
)

(defrule DividendForeignStock
    (risk m) ; high -> h, medium -> m, low -> l
    (profit h) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity m) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (and
        (ownership p)
        (ownership f)
    ) ; government -> g, private -> p, f -> foreign
    (payments y) ; yes -> y, no -> n
	=>
	(printout t "Дивидендные акции иностранных компаний.
    Например: JPMorgan, NextEra, Coca-Cola" crlf)
	(assert (final))
)

(defrule ForeignStock
    (risk m) ; high -> h, medium -> m, low -> l
    (profit h) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity m) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (and
        (ownership p)
        (ownership f)
    ) ; government -> g, private -> p, f -> foreign
    (payments n) ; yes -> y, no -> n
	=>
	(printout t "Акции иностранных компаний без дивидендов:
    Например: Facebook, McDonalds, Tesla" crlf)
	(assert (final))
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
	(printout t "Банковский вклад. 
    Альфа Банк - 20% на 2 мес, Тинькофф - 12% на 6 месяцев." crlf)
	(assert (final))
)

(defrule PrivateBond
    (risk l) ; high -> h, medium -> m, low -> l
    (profit l) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity l) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (payments y) ; yes -> y, no -> n
    (ownership p)
	=>
	(printout t "Облигации компаний.
    Например: облигации Газпром, ПИК." crlf)
	(assert (final))
)

(defrule GovBond
    (risk l) ; high -> h, medium -> m, low -> l
    (profit l) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity l) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (payments y) ; yes -> y, no -> n
	=>
	(printout t "Госсударственные облигации.
    Например: ОФЗ" crlf)
	(assert (final))
)

(defrule Futures
    (risk h) ; high -> h, medium -> m, low -> l
    (profit h) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity h) ; high -> h, medium -> m, low -> l
    (entryThreshold m) ; high -> h, medium -> m, low -> l
    (payments n) ; yes -> y, no -> n
	=>
	(printout t "Фьючерсы.
    Например: фьючерсы на нефть, валютные пары." crlf)
	(assert (final))
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
	(printout t "Валюта.
    Например: Доллар, Евро, Юань." crlf)
	(assert (final))
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
	(printout t "Недвижимость.
    Например: жилая, промышленная." crlf)
	(assert (final))
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
	(printout t "Криптовалюта.
    Например: BTC (биткоин), ETH (эфир)." crlf)
	(assert (final))
)

(defrule PreciousMetals
    (risk l) ; high -> h, medium -> m, low -> l
    (profit l) ; high -> h, medium -> m, low -> l
    (tax n) ; yes -> y, no -> n
    (complexity l) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (payments n) ; yes -> y, no -> n
	=>
	(printout t "Драгоценные металлы.
    Например: золото, медь, серебро." crlf)
	(assert (final))
)

(defrule Fund
    (risk l) ; high -> h, medium -> m, low -> l
    (profit l) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity l) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (payments y) ; yes -> y, no -> n
	=>
	(printout t "Инвестиционные фонды.
    Например: ETF акций американских компаний." crlf)
	(assert (final))
)
