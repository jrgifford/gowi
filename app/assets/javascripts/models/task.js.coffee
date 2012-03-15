class Gowi.Models.Task extends Backbone.Model
  
  eql: (other) ->
    @get('id') == other.id

