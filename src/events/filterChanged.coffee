define ['backbone','underscore'] , (Backbone, _) ->
  event = {}
  _.extend event, Backbone.Events
  event
