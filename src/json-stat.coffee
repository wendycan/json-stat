class window.JsonStat
  #options = [{key: get_count, format: {key: 'method', value: 'get'}}, {key: t, format: false}]
  constructor: (array) ->
    @collection = array

  # options = {time: t,condition: {key: 'method',values: ['get', 'post']}, by: 'day'}
  # target: ['t','day']
  statByTime: (options)->
    result0 = []
    result1 = []
    condition = options.condition
    time = options.time
    key = options.condition.key
    values = options.condition.values
    if options.by == 'day'
      # statistics by day
      for point in @collection
        do(point)->
          # count GET method
          if point[key] == values[0]
            last = result0[result0.length-1]
            if last == undefined
              tmp = {t: moment(point[time]).startOf('day').valueOf(), count: 0}
              result0.push tmp
              last = result0[result0.length-1]
            if moment(point[time]).isSame(last[time],'day')
              last.count++
            else
              tmp = {t: moment(point[time]).startOf('day').valueOf(), count: 1}
              result0.push tmp
          #  count POST method
          else if point[key] == values[1]
            last = result1[result1.length-1]
            if last == undefined
              tmp = {t: moment(point[time]).startOf('day').valueOf(), count: 0}
              result1.push tmp
              last = result1[result1.length-1]
            if moment(point[time]).isSame(last[time],'day')
              last.count++
            else
              tmp = {t: moment(point[time]).startOf('day').valueOf(), count: 1}
              result1.push tmp
      result = [result0,result1]
      console.log result
    else
      # statistics by others
      alert('Just can count by day')

  sortCollection: ->

  rangeTime: (start, end)->

  filterByTime: (options)->
