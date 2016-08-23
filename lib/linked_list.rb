require "./lib/node.rb"

class LinkedList

  attr_reader :head

  def initialize(head = nil)
      @head = head
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(data)
    end
  end

  def count
    if @head == nil
      0
    else
      count = 1
      current_node = @head
      until current_node.next_node == nil
        count += 1
        current_node = current_node.next_node
      end
      count
    end

  end

  def prepend(data)
    if @head == nil
      @head = Node.new(data)
    else
      old_head = @head
      @head = Node.new(data)
      @head.next_node = old_head
    end
  end

  def insert(spot, data)
    current_node = @head
    if spot == 0
      prepend(data)
    else
      counter = 0

      until counter == spot
        previous_node = current_node
        current_node = current_node.next_node
        counter += 1
      end

      old_node = current_node
      current_node = Node.new(data)
      current_node.next_node = old_node
      previous_node.next_node = current_node
    end
  end

  def to_string
    if @head == nil
      puts ""
    else
      current_node = @head
      output = "#{@head.data}"
      until current_node.next_node == nil
        current_node = current_node.next_node
        output += " #{current_node.data}"
      end
      output
    end
  end

  #catch error for when find searches for too many things and returns nil
  def find(starting_spot, num_elements)
    current_node = @head
    position = 0
    output = ""

    until position == starting_spot.to_i
      current_node = current_node.next_node
      position += 1
    end

    position = 1

    output += "#{current_node.data}"
    current_node = current_node.next_node

    until position == num_elements.to_i
        output += " #{current_node.data}"
        current_node = current_node.next_node
        position += 1
    end

    output
  end

  def includes?(query)
    result = false
    current_node = @head
    until current_node == nil
      return true if current_node.data == query
      current_node = current_node.next_node
    end
    false
  end

#does this need some sort of garbage collection to actually delete the element
#if it is not assigned to a variable?
  def pop
    current_node = @head
    until current_node.next_node.next_node == nil
      current_node = current_node.next_node
    end
    saved = current_node.next_node
    current_node.next_node = nil
    saved.data
  end

end
