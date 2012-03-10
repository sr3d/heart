class Heart.Routers.HeartsRouter extends Backbone.Router
  initialize: (options) ->
    @hearts = new Heart.Collections.HeartsCollection()
    @hearts.reset options.hearts

  routes:
    "/new"      : "newHeart"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newHeart: ->
    @view = new Heart.Views.Hearts.NewView(collection: @hearts)
    $("#hearts").html(@view.render().el)

  index: ->
    @view = new Heart.Views.Hearts.IndexView(hearts: @hearts)
    $("#hearts").html(@view.render().el)
    @view.addAll()

  show: (id) ->
    heart = @hearts.get(id)

    @view = new Heart.Views.Hearts.ShowView(model: heart)
    $("#hearts").html(@view.render().el)

  edit: (id) ->
    heart = @hearts.get(id)

    @view = new Heart.Views.Hearts.EditView(model: heart)
    $("#hearts").html(@view.render().el)
