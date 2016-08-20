require "./linked_list.rb"

class JungleBeat
  attr_accessor :list

  def initialize
    @list = LinkedList.new
  end

  def append(input)
    words = input.split
    words.each do |word|
      @list.append(word)
    end
  end

  def count
    @list.count
  end

  def play
    beats = @list.to_string
    `say -r 500 -v Boing "#{beats}"`
  end

end

jb = JungleBeat.new
jb.append("deep doo ditt woo hoo shu")
puts jb.count
puts jb.list.count
jb.play
