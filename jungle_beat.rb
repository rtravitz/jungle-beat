require "./linked_list.rb"

class JungleBeat
  attr_accessor :list, :voice, :rate

  def initialize(input="")
    @list = LinkedList.new
    @voice = "Boing"
    @rate = 500
    append(input)
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
    `say -r #{@rate} -v #{@voice} "#{beats}"`
  end

  def reset_voice
    @voice = "Boing"
  end

  def reset_rate
    @rate = 500
  end

end
