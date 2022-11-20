# frozen_string_literal: true

require_relative 'collection_finder_enum'

user_object = CollectionFinder.new
puts 'The result with eps = 10^-2'
print 'Element is: '
print user_object.solve(CollectionFinder::EPS_1)[0]
print ' Index is: '
print user_object.solve(CollectionFinder::EPS_1)[1]
puts "\nThe result with eps = 10^-4"
print 'Element is: '
print user_object.solve(CollectionFinder::EPS_2)[0]
print ' Index is: '
print user_object.solve(CollectionFinder::EPS_2)[1]
