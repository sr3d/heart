Heart.Views.Hearts ||= {}

class Heart.Views.Hearts.EditView extends Backbone.View
  template : JST["backbone/templates/hearts/edit"]

  events :
    "submit #edit-heart" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (heart) =>
        @model = heart
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
