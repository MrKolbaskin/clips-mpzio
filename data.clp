(defrule RussianStock
    (risk m) ; high -> h, medium -> m, low -> l
    (profit h) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity m) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (ownership p) ; government -> g, private -> p, f -> foreign
    (payments n) ; yes -> y, no -> n
	=>
    (printout t "------------- Рекомендуемый актив -------------" crlf)
	(printout t "Акции российских компаний." crlf)
    (printout t "Например: Яндекс, VK, OZON." crlf)
    (printout t "Свойства:" crlf)
    (printout t "Доходность: высокая, риск: средний, сложность: средняя, порог входа по деньгам: низкий" crlf)
    (printout t "Регулярные выплаты: есть, оплата налогов: необходима, российский частный актив" crlf)
	(printout t "-----------------------------------------------" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
	(assert (final))
)

(defrule DividendRussianStock
    (risk m) ; high -> h, medium -> m, low -> l
    (profit m) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity m) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (ownership p) ; government -> g, private -> p, f -> foreign
    (payments y) ; yes -> y, no -> n
	=>
    (printout t "------------- Рекомендуемый актив -------------" crlf)
	(printout t "Дивидендные акции российских компаний." crlf)
    (printout t "Например: Сбер, Лукойл, Норникель." crlf)
    (printout t "Свойства:" crlf)
    (printout t "Доходность: высокая, риск: средний, сложность: средняя, порог входа по деньгам: низкий" crlf)
    (printout t "Регулярные выплаты: есть, оплата налогов: необходима, российский частный актив" crlf)
	(printout t "-----------------------------------------------" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
	(assert (final))
)

(defrule DividendForeignStock
    (risk m) ; high -> h, medium -> m, low -> l
    (profit m) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity m) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (and
        (ownership p)
        (ownership f)
    ) ; government -> g, private -> p, f -> foreign
    (payments y) ; yes -> y, no -> n
	=>
    (printout t "------------- Рекомендуемый актив -------------" crlf)
	(printout t "Дивидендные акции иностранных компаний." crlf)
    (printout t "Например: JPMorgan, NextEra, Coca-Cola" crlf)
    (printout t "Свойства:" crlf)
    (printout t "Доходность: высокая, риск: средний, сложность: средняя, порог входа по деньгам: низкий" crlf)
    (printout t "Регулярные выплаты: есть, оплата налогов: необходима, иностранный частный актив" crlf)
	(printout t "-----------------------------------------------" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
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
    (printout t "------------- Рекомендуемый актив -------------" crlf)
	(printout t "Акции иностранных компаний без дивидендов." crlf)
    (printout t "Например: Facebook, McDonalds, Tesla" crlf)
    (printout t "Свойства:" crlf)
    (printout t "Доходность: высокая, риск: средний, сложность: средняя, порог входа по деньгам: низкий" crlf)
    (printout t "Регулярные выплаты: нет, оплата налогов: необходима, иностранный частный актив" crlf)
	(printout t "-----------------------------------------------" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
	(assert (final))
)

(defrule Deposit
    (risk l) ; high -> h, medium -> m, low -> l +
    (profit l) ; high -> h, medium -> m, low -> l +
    (tax n) ; yes -> y, no -> n +
    (complexity l) ; high -> h, medium -> m, low -> l +
    (entryThreshold l) ; high -> h, medium -> m, low -> l +
    (ownership p) ;+
    (payments y) ; yes -> y, no -> n +
	=>
    (printout t "------------- Рекомендуемый актив -------------" crlf)
	(printout t "Банковский вклад." crlf)
    (printout t "Например: Альфа Банк - 20% на 2 мес, Тинькофф - 12% на 6 месяцев." crlf)
    (printout t "Свойства:" crlf)
    (printout t "Доходность: низкая, риск: низкий, сложность: низкая, порог входа по деньгам: низкий" crlf)
    (printout t "Регулярные выплаты: есть, оплата налогов: не нужна, частный актив" crlf)
	(printout t "-----------------------------------------------" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
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
    (printout t "------------- Рекомендуемый актив -------------" crlf)
	(printout t "Облигации компаний." crlf)
    (printout t "Например: облигации Газпром, облигации ПИК" crlf)
    (printout t "Свойства:" crlf)
    (printout t "Доходность: низкая, риск: низкий, сложность: низкая, порог входа по деньгам: низкий" crlf)
    (printout t "Регулярные выплаты: есть, оплата налогов: необходима, тип собственности: частная" crlf)
	(printout t "-----------------------------------------------" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
	(assert (final))
)

(defrule GovBond
    (risk l) ; high -> h, medium -> m, low -> l
    (profit l) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity l) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (payments y) ; yes -> y, no -> n
    (ownership g)
	=>
    (printout t "------------- Рекомендуемый актив -------------" crlf)
	(printout t "Госсударственные облигации." crlf)
    (printout t "Например: ОФЗ" crlf)
    (printout t "Свойства:" crlf)
    (printout t "Доходность: низкая, риск: низкий, сложность: низкая, порог входа по деньгам: низкий" crlf)
    (printout t "Регулярные выплаты: есть, оплата налогов: необходима, госсударственный актив" crlf)
	(printout t "-----------------------------------------------" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
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
    (printout t "------------- Рекомендуемый актив -------------" crlf)
	(printout t "Фьючерсы." crlf)
    (printout t "Например: фьючерсы на нефть, валютные пары" crlf)
    (printout t "Свойства:" crlf)
    (printout t "Доходность: высокая, риск: высокий, сложность: высокая, порог входа по деньгам: средний" crlf)
    (printout t "Регулярные выплаты: нет, оплата налогов: необходима" crlf)
	(printout t "-----------------------------------------------" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
	(assert (final))
)

(defrule Currency
    (risk l) ; high -> h, medium -> m, low -> l
    (profit l) ; high -> h, medium -> m, low -> l
    (tax n) ; yes -> y, no -> n
    (complexity l) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (and
        (ownership f)
        (ownership g)
    )
    (payments n) ; yes -> y, no -> n
	=>
    (printout t "------------- Рекомендуемый актив -------------" crlf)
	(printout t "Валюта." crlf)
    (printout t "Например: Доллар, Евро, Юань" crlf)
    (printout t "Свойства:" crlf)
    (printout t "Доходность: низкая, риск: низкий, сложность: низкая, порог входа по деньгам: низкий" crlf)
    (printout t "Регулярные выплаты: нет, оплата налогов: не нужна" crlf)
	(printout t "-----------------------------------------------" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
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
    (printout t "------------- Рекомендуемый актив -------------" crlf)
	(printout t "Недвижимость." crlf)
    (printout t "Например: жилая, промышленная" crlf)
    (printout t "Свойства:" crlf)
    (printout t "Доходность: средняя, риск: низкий, сложность: средняя, порог входа по деньгам: высокий" crlf)
    (printout t "Регулярные выплаты: возможны, оплата налогов: необходима" crlf)
	(printout t "-----------------------------------------------" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
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
    (printout t "------------- Рекомендуемый актив -------------" crlf)
	(printout t "Криптовалюта." crlf)
    (printout t "Например: BTC (биткоин), ETH (эфир)" crlf)
    (printout t "Свойства:" crlf)
    (printout t "Доходность: высокая, риск: высокий, сложность: высокая, порог входа по деньгам: низкий" crlf)
    (printout t "Регулярные выплаты: нет, оплата налогов: на данный момент не нужна" crlf)
	(printout t "-----------------------------------------------" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
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
    (printout t "------------- Рекомендуемый актив -------------" crlf)
	(printout t "Драгоценные металлы." crlf)
    (printout t "Например: золото, медь, серебро" crlf)
    (printout t "Свойства:" crlf)
    (printout t "Доходность: низкая, риск: низкий, сложность: низкая, порог входа по деньгам: низкий" crlf)
    (printout t "Регулярные выплаты: нет, оплата налогов: не нужна" crlf)
	(printout t "-----------------------------------------------" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
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
    (printout t "------------- Рекомендуемый актив -------------" crlf)
	(printout t "Инвестиционные фонды." crlf)
    (printout t "Например: ETF акций американских компаний" crlf)
    (printout t "Свойства:" crlf)
    (printout t "Доходность: низкий, риск: низкий, сложность: низкая, порог входа по деньгам: низкий" crlf)
    (printout t "Регулярные выплаты: есть, оплата налогов: необходима" crlf)
	(printout t "-----------------------------------------------" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
	(assert (final))
)
