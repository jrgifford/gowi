class Gowi.Routers.Tasks extends Backbone.Router
  routes:
    '': 'index'
    'tasks/:id': 'show'
  
  initialize: ->
    @collection = new Gowi.Collections.Tasks()
    @collection.reset($('#container').data('tasks'))
  
  index: ->
    view = new Gowi.Views.TasksIndex(collection: @collection)
    $('#container').html(view.render().el)
  
  show: (id) ->
    alert "Task #{id}"