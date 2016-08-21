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
    beats = validate(input)
    beats.each do |beat|
      @list.append(beat)
    end
  end

  def prepend(input)
    beats = validate(input).reverse
    beats.each do |beat|
      @list.prepend(beat)
    end
  end

  def count
    @list.count
  end

  def play
    `say -r #{@rate} -v #{@voice} "#{@list.to_string}"`
  end

  def all
    @list.to_string
  end

  def reset_voice
    @voice = "Boing"
  end

  def reset_rate
    @rate = 500
  end

  def validate(beats)
    approved = %w[tee dee deep bop boop la na]
    output = beats.split.map do |beat|
      beat if approved.include?(beat)
    end
    output.compact
  end

end
