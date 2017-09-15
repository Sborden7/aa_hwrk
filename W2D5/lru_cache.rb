class LRUCache
  attr_accessor :cache, :size
   def initialize(size)
     @cache = []
     @size = 0
   end

   def count
     cache.count
   end

   def add(el)
    if cache.include?(el)
       cache.delete(el)
       cache.push(el)
     elsif count >= size
       cache.shift
       cache << el
     else
       cache << el
     end
   end

   def show
     print cache
   end

 end
