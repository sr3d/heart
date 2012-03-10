Heart.Views.Hearts ||= {}

class Heart.Views.Hearts.NewView extends Backbone.View
  template: JST["backbone/templates/hearts/new"]

  events:
    "submit #new-heart": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (heart) =>
        @model = heart
        window.location.hash = "/#{@model.id}"

      error: (heart, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
