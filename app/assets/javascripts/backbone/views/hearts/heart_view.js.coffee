Heart.Views.Hearts ||= {}

class Heart.Views.Hearts.HeartView extends Backbone.View
  template: JST["backbone/templates/hearts/heart"]
  className: 'heart'

  events:
    "click .destroy" : "destroy"
  
  initialize: ->
    @velocity = 0.3 + Math.random()

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    json = _.extend { cid: @cid }, @model.toJSON()
    @$el.html @template( json )
    @drawHeart()
    @

  drawHeart: ->
    @canvas = @$('canvas')[0]
    context = @canvas.getContext('2d')
    context.strokeStyle = 'rgb(255, 64, 127)'
    context.fillStyle = 'rgba(255, 64, 127, 0.7)'

    context.beginPath();
    context.moveTo(100, 200);
    context.lineTo(3, 67);
    context.fill();
    context.stroke();

    context.beginPath();
    context.arc(50, 50, 50, 0, 160 * Math.PI / 180, true);
    context.stroke();
      
    context.beginPath();
    context.arc(150, 50, 50, 180 * Math.PI / 180, 20 * Math.PI / 180, false);
    context.stroke();

    context.beginPath();
    context.moveTo(197, 67);
    context.lineTo(100, 200);
    context.stroke();


  position: (left, top) ->
    left ?= Math.random() * $(window).width()
    top  ?= Math.random() * $(window).height()
    @left = left
    @top = top
    @$el.css left: left, top: top

  height: -> @$el.height()
  width:  -> @$el.width()

  reposition: (scrollTop) =>
    top = - @velocity * (scrollTop - @top)
    @$el.css top: top
