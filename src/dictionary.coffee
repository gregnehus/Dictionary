define ["cs!src/node"], (Node) ->
  class Dictionary
    constructor : () ->
      @nodes = {}

    add: (word) ->
      pointer = @
      index = 0

      # go through each character in word and either create a node or use existing
      for character in word
        index += 1
        if not pointer.nodes[character]?
          pointer.nodes[character] = new Node character

        # in order to keep track of the end of words, we need to keep each end node
        # set to true regardless of future adds
        pointer.nodes[character].isEnd |= index == word.length

        pointer = pointer.nodes[character]

    getWords: (prefix) ->
      words = []
      pointer = @
      sum = ""

      for character in prefix
        currentNode = pointer.nodes[character]
        return if not currentNode?

        pointer = pointer.nodes[character]
        sum += character

      stack = [{sum: sum, pointer: pointer}]

      while stack.length > 0
        current = stack.pop()
        words.push current.sum if current.pointer.isEnd

        for key of current.pointer.nodes
          node = current.pointer.nodes[key]

          stack.push
            sum: current.sum + node.value
            pointer: node

      words

  new Dictionary()

