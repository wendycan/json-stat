class JsonStat
  #options = [{key: get_count, format: {key: 'method', value: 'get'}}, {key: t, format: false}]
  constructor: (array, options) ->
    @data = array
    @keys = [options]
    @result = []
  handle: ->
    for point in @data
      do(point) ->
        tmp = {}
        tmp.option.key = 0
        for option in @options
          do(option) =>
            if option.format == false
              # ...
              tmp.option.key = point.option.key
            else
              if point.option.format.key == point.option.format.value
                tmp.option.key++
            result.push tmp
