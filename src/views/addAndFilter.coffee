define ["backbone", "text!templates/addAndFilter.html",'cs!src/dictionary','cs!events/filterChanged'], (Backbone, template, Dictionary, filterChanged) ->
  view = Backbone.View.extend
    el: ".addAndFilter"
    initialize: () ->
      @filter = ""

    events:
      "click #addWord" 	: "addWord"
      "keyup #filterBy" : "filterChanged"

    render: () ->
      @$el.html _.template template

    addWord: () ->
      newWord = @$("#newWord").val()
      @$("#newWord").val ""
      Dictionary.add newWord
      @filterChanged()


    filterChanged: () ->
      filter = @$("#filterBy").val()
      filterChanged.trigger "filter", filter


  new view()