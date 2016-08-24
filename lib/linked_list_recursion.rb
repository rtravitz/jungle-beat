require "./lib/node.rb"

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
    @next = nil
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
      output += " #{position.data}"
      output
    else
      if output == ""
        output += "#{position.data}"
        position = position.next_node
        to_string(position, output)
      else
        output += " #{position.data}"
        position = position.next_node
        to_string(position, output)
      end
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




end

list = LinkedList.new
list.append("hey")
list.append("sup")
list.append("dawg")

require "pry"; binding.pry
