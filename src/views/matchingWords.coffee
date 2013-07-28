define ["backbone", "text!templates/matchingWords.html",'cs!src/dictionary','cs!events/filterChanged'], (Backbone, template, Dictionary, filterChanged) ->
  view = Backbone.View.extend
    el: ".matchingWords"
    initialize: () ->
      @filter = ""
      filterChanged.on "filter", (e) =>
        @filter = e
        @render()

    render: () ->
      console.log "render"
      @$el.html _.template template,
        words: Dictionary.getWords @filter

  new view()