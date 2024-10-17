sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'interactionitems/test/integration/FirstJourney',
		'interactionitems/test/integration/pages/InteractionHeaderList',
		'interactionitems/test/integration/pages/InteractionHeaderObjectPage'
    ],
    function(JourneyRunner, opaJourney, InteractionHeaderList, InteractionHeaderObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('interactionitems') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheInteractionHeaderList: InteractionHeaderList,
					onTheInteractionHeaderObjectPage: InteractionHeaderObjectPage
                }
            },
            opaJourney.run
        );
    }
);