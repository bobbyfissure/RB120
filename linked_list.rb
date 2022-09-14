class LinkedList
  attr_accessor :head

  def initialize
    self.head = nil
  end

  def add(value)
    if self.head.nil?
      self.head = Node.new(value, nil)
    else
      lastNode = self.head
      while(!lastNode.nextNode.nil?)
        lastNode = lastNode.nextNode
      end
    end
  end
    


  private

  class Node
    attr_accessor :value, :nextNode

    def initialize(value, next_node)
      self.value = value
      self.nextNode = next_node
    end
  end

end