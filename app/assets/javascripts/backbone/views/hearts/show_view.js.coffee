Heart.Views.Hearts ||= {}

class Heart.Views.Hearts.ShowView extends Backbone.View
  template: JST["backbone/templates/hearts/show"]

  render: ->
    json = _.extend { cid: @cid }, @model.toJSON()
    @$el.html @template( template );
    return this
