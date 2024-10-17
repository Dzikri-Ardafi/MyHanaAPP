namespace app.db.interactions;

using {
    Country,
    Currency,
    cuid,
    managed
} from '@sap/cds/common';

type BusinessKey: String(10);
type Price: Decimal(10,2);
type Text: String(1024);

entity Headers: cuid, managed{
    items: Composition of many Items
                        on items.interactions = $self;
    partner: BusinessKey;
    country: Country
}

entity Items: cuid{
    interactions: Association to Headers;
    text: localized Text;
    date: DateTime;
    @Semantics.amount.currencyNode : 'currency'
    price: Price;
    currency: Currency
}