using {app.db.interactions as InteractionSchema} from '../db/interactions';
using {sap} from '@sap/cds-common-content';

service CatalogService{
    // --> Define auth (only authenticated user can get Interaction Header)
    @requires : 'authenticated-user'
    @cds.redirection.target

    // --> define service entity for header
    @odata.draft.enabled: true
    entity InteractionHeader as projection on InteractionSchema.Headers;

    @requires: 'Admin'
    // --> define service entity for items
    entity InteractionItems as projection on InteractionSchema.Items;


    @readonly
    entity Languages as projection on sap.common.Languages;

    @readonly
    @restrict:[
        {
            grant: 'READ',
            where: 'country_code = ''DE'''
        }
    ]
    entity HeaderView as projection on InteractionSchema.Headers;
}