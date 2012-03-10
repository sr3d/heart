class Heart.Models.Heart extends Backbone.Model
  paramRoot: 'heart'

  defaults:
    description: null

class Heart.Collections.HeartsCollection extends Backbone.Collection
  model: Heart.Models.Heart
  url: '/hearts'
