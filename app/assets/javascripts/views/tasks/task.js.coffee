class Gowi.Views.Task extends Backbone.View
  template: JST['tasks/task']
  tagName: 'li'
  
  events:
    'click': 'showEntry'
  
  initialize: ->
    @model.on('change', @render, this)

  showEntry: =>
    Backbone.history.navigate("tasks/#{@model.get('id')}", true)
  
  render: ->
    $(@el).html(@template(task: @model))
    this