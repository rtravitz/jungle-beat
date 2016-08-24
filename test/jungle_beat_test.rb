require "./lib/jungle_beat"
require "minitest/autorun"
require "minitest/pride"

class JungleBeatTest < Minitest::Test

  def test_can_create_jungle_beat_instance
    jb = JungleBeat.new

    assert_instance_of JungleBeat, jb
  end

  def test_jungle_beat_initializes_with_linked_list
    jb = JungleBeat.new

    assert_instance_of LinkedList, jb.list
  end

  def test_jungle_beat_can_initialize_with_data_on_approved_list
    jb = JungleBeat.new("tee")

    assert_equal "tee", jb.list.head.data

    jb = JungleBeat.new("bearshark")

    assert_equal nil, jb.list.head
  end

  def test_append_adds_multiple_items
    jb = JungleBeat.new

    assert_equal "", jb.list.to_string

    jb.append("tee dee deep")

    assert_equal "tee dee deep", jb.list.to_string
  end

  def test_prepend_adds_multiple_items
    jb = JungleBeat.new
    jb.append("la")

    assert_equal "la", jb.list.to_string

    jb.prepend("tee dee deep")

    assert_equal "tee dee deep la", jb.list.to_string
  end

  def test_count_returns_correct_count
    jb = JungleBeat.new

    assert_equal 0, jb.count

    jb.append("tee dee deep")

    assert_equal 3, jb.count
  end

  def test_play_includes_correct_beats
    jb = JungleBeat.new
    jb.append("tee dee deep")

    assert_equal `say -r 500 -v "Boing" "tee dee deep"`, jb.play
  end

  def test_all_prints_all_beats
    jb = JungleBeat.new
    jb.append("tee dee deep")

    assert_equal "tee dee deep", jb.all
  end

  def test_voice_can_be_changed
    jb = JungleBeat.new

    assert_equal "Boing", jb.voice

    jb.voice = "Alice"

    assert_equal "Alice", jb.voice
  end

  def test_rate_can_be_changed
    jb = JungleBeat.new

    assert_equal 500, jb.rate

    jb.rate = 100

    assert_equal 100, jb.rate
  end

  def test_reset_voice_returns_to_Boing
    jb = JungleBeat.new
    jb.voice = "Alice"

    assert_equal "Alice", jb.voice

    jb.reset_voice

    assert_equal "Boing", jb.voice
  end

  def test_reset_rate_returns_to_500
    jb = JungleBeat.new
    jb.rate = 100

    assert_equal 100, jb.rate

    jb.reset_rate

    assert_equal 500, jb.rate
  end

  def test_validate_only_allows_approved_beats
    #approved beats include "tee dee deep bob boop la na"
    jb = JungleBeat.new

    assert_equal ["tee", "dee", "bop", "la"], jb.validate("tee dee hey bop lol la")
  end

  def test_validate_works_with_append
    jb = JungleBeat.new
    jb.append("tee dee hey bop lol la")

    assert_equal "tee dee bop la", jb.list.to_string
  end

  def test_validate_works_with_prepend
    jb = JungleBeat.new
    jb.prepend("tee dee hey bop lol la")

    assert_equal "tee dee bop la", jb.list.to_string
  end

  def test_all_prints_complete_list_of_beats
    jb = JungleBeat.new
    jb.append("tee dee deep")

    assert_equal "tee dee deep", jb.all
  end

end
