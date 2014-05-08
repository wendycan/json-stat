class window.JsonStat
  #options = [{key: get_count, format: {key: 'method', value: 'get'}}, {key: t, format: false}]
  constructor: (array, options) ->
    @collection = array
    @keys = [options]
    @result = []

  # option = {time: t,condition: {key: 'method',value: 'get'}, by: 'day', target: ['t','day'] }
  statByTime: (option)->
    console.log option
    get_result = []
    post_result = []
    if option.by == 'day'
      # statistics by day
      for point in @collection
        do(point)->
          # count GET method
          if point.method == 'GET'
            last = get_result[get_result.length-1]
            if last == undefined
              tmp = {t: moment(point.t).startOf('day'), get_count: 0}
              get_result.push tmp
              last = get_result[get_result.length-1]
            if moment(point.t).isSame(last.t,'day')
              last.get_count++
            else
              tmp = {t: moment(point.t).startOf('day'), get_count: 1}
              get_result.push tmp
          #  count POST method
          else if point.method == 'POST'
            last = post_result[post_result.length-1]
            if last == undefined
              tmp = {t: moment(point.t).startOf('day'), post_count: 0}
              post_result.push tmp
              last = post_result[post_result.length-1]
            if moment(point.t).isSame(last.t,'day')
              last.post_count++
            else
              tmp = {t: moment(point.t).startOf('day'), post_count: 1}
              post_result.push tmp
      console.log get_result
      console.log post_result
    else
      # statistics by others

  rangeTime: (start, end)->

  filterByTime: (option)->
  # statTime: ->
  #   for point in @data
  #     do(point) ->
  #       tmp = {}
  #       tmp.option.key = 0
  #       for option in @options
  #         do(option) =>
  #           if option.format == false
  #             # ...
  #             tmp.option.key = point.option.key
  #           else
  #             if point.option.format.key == point.option.format.value
  #               tmp.option.key++
  #           result.push tmp
