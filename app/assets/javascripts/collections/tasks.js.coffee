class Gowi.Collections.Tasks extends Backbone.Collection
  url: '/api/tasks'
  model: Gowi.Models.Task
  
  addUnlessExisting: (data) ->
    exists = @any (task) ->
      return task.eql data
          
    @add data unless exists
