class Heart.Views.Heart extends Backbone.View
  template : JST["backbone/templates/heart"]

  events :
    "submit #edit-word" : "update"

  update : (e) ->
    # e.preventDefault()
    # e.stopPropagation()

    # @model.save(null,
    #   success : (word) =>
    #     @model = word
    #     window.location.hash = "/#{@model.id}"
    # )

  render : ->
    alert('test')
    json = _.extend { cid: @cid }, @model.toJSON()
    @$el.html @template( template );
    return this
