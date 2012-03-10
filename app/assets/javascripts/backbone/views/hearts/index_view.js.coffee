Heart.Views.Hearts ||= {}

class Heart.Views.Hearts.IndexView extends Backbone.View
  template: JST["backbone/templates/hearts/index"]
  className: 'app'

  initialize: () ->
    @options.hearts.bind('reset', @addAll)

    @options.hearts.bind('add', @addOne)

    @views = []

  addAll: () =>
    @options.hearts.each @addOne

  addOne: (heart) =>
    view = new Heart.Views.Hearts.HeartView({model : heart})
    @$el.append view.render().el
    @views.push view
    @position view

  render: =>
    $(@el).html @template()
    @bindEvents()
    @


  bindEvents: =>
    # @$el.scroll @onScroll
    $(document).scroll @onScroll

  position: (heart) ->
    ySpread = 80
    height = heart.height()
    width  = heart.width()
    left = Math.min Math.random() * $(window).width(), 
                    $(window).width() - 250
    # top = Math.random() * height
    top = Math.random() * height + ySpread * @views.length
    heart.position left, top
    
    t = (top + height)
    $('#hearts').css height: t + 'px'
    # $('#fauxScroll').css height: t + 'px'


  onScroll: (e) =>
    # alert('test');
    scrollTop = $(e.currentTarget).scrollTop()

    console.log [ scrollTop, $(document).height()]
    if(scrollTop > ($(document).height() - 1000))
      @fetchMoreHearts()

    for view in @views
      view.reposition scrollTop

  fetchMoreHearts: =>
    console.log 'fetchMoreHearts'
    hearts = @options.hearts
    for heart in window.hearts
      hearts.add {description: heart.description}

    # count = hearts.length
    # for i in [1..20]
    #   hearts.add({description: "love #" + (i + count)})
    # for i in [ i .. (i+20)]
    #   hearts.add({description: "love #" + i});
    # for i in [ hearts.length .. hearts.length + 40 ]
      
    # @options.hearts.

