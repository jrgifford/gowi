class Gowi.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']
  
  events:
    'submit #new_task': 'createTask'
  
  initialize: =>
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTask, this)
    faye = new Faye.Client('http://localhost:9292/faye')
    faye.subscribe '/tasks/new',
        (data) =>
            @collection.addUnlessExisting data
            return
  
  render: ->
    $(@el).html(@template())
    @collection.each(@appendTask)
    this
  
  appendTask: (task) =>
    view = new Gowi.Views.Task(model: task)
    @$('#tasks').append(view.render().el)
  
  createTask: (task) ->
    task.preventDefault()
    attributes = description: $('#new_task_description').val()
    console.log(attributes)
    @collection.create attributes,
      wait: true
      success: -> $('#new_task')[0].reset()
      error: @handleError
  
  addRemoteTask: (task) =>
    @collection.add task
  
  handleError: (task, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages