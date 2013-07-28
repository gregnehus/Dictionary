require({
    paths: {
        cs: 'lib/cs',
        text: 'lib/text',
        'coffee-script':'lib/coffee-script',
        underscore: "lib/underscore-min",
        baseurl: '.',
        text:'lib/text',
        backbone: 'lib/backbone-min',
        models: 'src/models',
        views: 'src/views',
        jquery: 'lib/jquery-1.10.2.min',
        domReady: 'lib/domReady',
        events: 'src/events'
    },
    shim: {
        underscore: {
            exports: "_"
        },
        backbone:{
            deps:['underscore','jquery'],
            exports:'Backbone'
        },

        jquery:{
            exports:'$'
        }
    }
}, ['cs!views/addAndFilter','cs!views/matchingWords','domReady'], function(AddAndFilterView, MatchingWordsView){

    AddAndFilterView.render();
    MatchingWordsView.render();
});
