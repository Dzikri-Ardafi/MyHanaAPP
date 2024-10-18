### Install HANA CLI
`npm install -g hana-cli`

### Use reusable set of content provided by SAP
`npm add @sap/cds-common-content --save`

### Build Schema Into HANA Database
`cds build --production`

### Generated auth requires role
`cds compile srv/ --to xsuaa > xs-security.json`

### Create XSUAA instance on BTP based on xs-security.json
`cf create-service xsuaa application MyHanaAPP-auth -c xs-security.json`

### Create a service key to access to the credentials fpr XSUAA instance
`cf create-service-key MyHanaAPP-auth default`

### Bind our running CAP application to HANA DB
`cds bind -2 MyHanaAPP-auth default`

### Start the application router to inject all the UAA config
`cds bind --exec --- npm start --prefix app/router`