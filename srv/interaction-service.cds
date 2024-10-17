using {app.db.interactions as InteractionSchema} from '../db/interactions';
using {sap} from '@sap/cds-common-content';

service CatalogService{
    // --> define service entity for header
    @odata.draft.enabled: true
    entity InteractionHeader as projection on InteractionSchema.Headers;

    // --> define service entity for items
    entity InteractionItems as projection on InteractionSchema.Items;


    @readonly
    entity Languages as projection on sap.common.Languages;
}