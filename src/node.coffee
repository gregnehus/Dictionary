define [], () ->
  class Node
    constructor : (@value, @isEnd = false) ->
      @nodes = {}