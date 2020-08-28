require 'pry'

require_relative 'lib/cat.rb'
require_relative 'lib/dog.rb'
require_relative 'lib/owner.rb'

o = Owner.new ("bree")
d = Dog.new("daisy", o)

binding.pry

# questions:
# - when do you know when to put attributes in initialize
# or in the body of initialize, especially default values

# ah-ha! moments:
# accessing up second pry in an iteration:
# - use do/end instead of "{}""
# - run ruby file
# - check to make sure you have your instances
# - run the instance.desired_method to access second pry
# - test variable