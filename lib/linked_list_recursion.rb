require "./lib/node.rb"

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data, position = @head)
    if @head.nil?
      @head = Node.new(data)
    elsif position.next_node.nil?
      position.next_node = Node.new(data)
    else
      position = position.next_node
      append(data, position)
    end
  end

  def count(position = @head, counter = 0)
    if @head.nil?
      counter
    elsif position.next_node.nil?
      counter + 1
    else
      counter += 1
      position = position.next_node
      count(position, counter)
    end
  end

  def to_string(position = @head, output = "")
    if @head.nil?
      output
    elsif position.next_node.nil?
      if output.empty?
        output += "#{position.data}"
      else
        output += " #{position.data}"
      end
      output
    else
      if output.empty?
        output += "#{position.data}"
      else
        output += " #{position.data}"
      end
      position = position.next_node
      to_string(position, output)
    end
  end

  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
    else
      old_node = @head
      @head = Node.new(data)
      @head.next_node = old_node
    end
  end

  def insert(spot, data, position = @head, counter = 0)
    if spot.zero?
      prepend(data)
    else
      if counter == (spot - 1)
        old_node = position.next_node
        position.next_node = Node.new(data)
        position.next_node.next_node = old_node
      else
        counter += 1
        position = position.next_node
        insert(spot, data, position, counter)
      end
    end
  end

  def find(starting_spot, num_elements, position = @head, counter = 0, output = "")
    if counter >= starting_spot
      if (starting_spot + num_elements - 1) >= counter
        if output.empty?
          output += "#{position.data}"
        else
          output += " #{position.data}"
        end
        counter += 1
        position = position.next_node
        find(starting_spot, num_elements, position, counter, output)
      else
        output
      end
    else
      counter += 1
      position = position.next_node
      find(starting_spot, num_elements, position, counter, output)
    end
  end

  def includes?(query, position = @head)
    if position.data == query
      true
    elsif position.next_node.nil?
      false
    else
      position = position.next_node
      includes?(query, position)
    end
  end

  def pop(position = @head)
    if position.next_node.next_node.nil?
      old_node = position.next_node
      position.next_node = nil
      return old_node.data
    else
      position = position.next_node
      pop(position)
    end
  end

end
