require 'rspec'

class LRUCache

  attr_reader :size, :cache

   def initialize(size)
     @size = size
     @cache = []
   end

   def count
     # returns number of elements currently in cache
     @cache.length
   end

   def add(el)
     # adds element to cache according to LRU principle
     if cache.include?(el)
      cache.delete(el)
      cache.unshift(el)
    elsif count >= size
      cache.pop
      cache.unshift(el)
    else
      cache.unshift(el)
    end
   end

   def show
      p cache.reverse
   end

 end
