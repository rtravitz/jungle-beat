require "./lib/node.rb"

class LinkedList

  attr_reader :head

  def initialize(head = nil)
      @head = head
  end

  def append(data)
    new_node = Node.new(data)
    @head.nil? ? @head = new_node : cycle_to_end("node").next_node = new_node
  end


  def count
    @head.nil? ? 0 : cycle_to_end("return_count")
  end

  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
    else
      old_head = @head
      @head = Node.new(data)
      @head.next_node = old_head
    end
  end

  def insert(given_index, data)
    if given_index == 0
      prepend(data)
    else
      before_inserted_node = cycle_to_position(given_index - 1)
      after_inserted_node = cycle_to_position(given_index)
      node = Node.new(data)
      before_inserted_node.next_node = node
      node.next_node = after_inserted_node
    end
  end

  def to_string
    if @head.nil?
      ""
    else
      current_node = @head
      output = "#{@head.data}"
      until current_node.next_node.nil?
        current_node = current_node.next_node
        output += " #{current_node.data}"
      end
      output
    end
  end

  #catch error for when find searches for too many things and returns nil
  def find(starting_spot, num_elements)
    output = ""

    current_node = cycle_to_position(starting_spot)
    output += "#{current_node.data}"

    position = 1
    current_node = current_node.next_node

    until position == num_elements
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

  def cycle_to_end(mode)
    current_node = @head
    count = 1
    until current_node.next_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    mode == "node" ? current_node : count
  end

  def cycle_to_position(index)
    position = @head
    counter = 0
    until counter == index
      position = position.next_node
      counter += 1
    end
    position
  end

end
