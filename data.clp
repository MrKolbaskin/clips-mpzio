(defrule Stock
    (risk m) ; high -> h, medium -> m, low -> l
    (profit h) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity m) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (ownership p) ; government -> g, private -> p, f -> foreign
    (payments n) ; yes -> y, no -> n
	=>
	(printout t "Stock - бла бла" crlf)
	(assert (final))
)

(defrule DividendlStock
    (risk m) ; high -> h, medium -> m, low -> l
    (profit h) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity m) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (ownership p) ; government -> g, private -> p, f -> foreign
    (payments y) ; yes -> y, no -> n
	=>
	(printout t "Stock - бла бла" crlf)
	(assert (final))
)

(defrule ForeignStock
    (risk m) ; high -> h, medium -> m, low -> l
    (profit h) ; high -> h, medium -> m, low -> l
    (tax y) ; yes -> y, no -> n
    (complexity m) ; high -> h, medium -> m, low -> l
    (entryThreshold l) ; high -> h, medium -> m, low -> l
    (ownership p f) ; government -> g, private -> p, f -> foreign
    (payments y) ; yes -> y, no -> n
	=>
	(printout t "Stock - бла бла" crlf)
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
	(printout t "Deposit - бла бла" crlf)
	(assert (final))
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
	(printout t "Currency - бла бла" crlf)
	(assert (final))
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
	(printout t "Realty - бла бла" crlf)
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
	(printout t "Crypto - бла бла" crlf)
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
	(printout t "Precious Metals - бла бла" crlf)
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
	(printout t "Fund - бла бла" crlf)
	(assert (final))
)
