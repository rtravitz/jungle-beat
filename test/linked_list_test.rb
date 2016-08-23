require "./lib/linked_list"
require "minitest/autorun"
require "minitest/pride"

class LinkedListTest < Minitest::Test

  def test_a_list_can_be_created
    list = LinkedList.new

    assert_equal LinkedList, list.class
  end

  def test_head_is_nil_by_default
    list = LinkedList.new

    assert_equal nil, list.head
  end

  def test_append_adds_data_to_head_if_head_is_empty
    list = LinkedList.new
    list.append("doop")

    assert_equal "doop", list.head.data
  end

  def test_count_returns_correct_number
    list = LinkedList.new
    list.append("doop")

    assert_equal 1, list.count
  end

  def test_to_string_returns_string_of_head_data
    list = LinkedList.new
    list.append("doop")

    assert_equal "doop", list.to_string
  end

  def test_append_can_add_multiple_nodes
    list = LinkedList.new

    assert_equal nil, list.head

    list.append("doop")

    assert_equal nil, list.head.next_node

    list.append("deep")

    assert_equal "deep", list.head.next_node.data
  end

  def test_count_handles_multiple_nodes
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("dip")

    assert_equal 3, list.count
  end

  def test_to_string_prints_multiple_nodes
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("yip")

    assert_equal "doop deep yip", list.to_string
  end

  def test_prepend_adds_node_to_head
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")

    assert_equal "dop", list.head.data
  end

  def test_prepend_moves_former_head_to_next_node
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")

    assert_equal "plop", list.head.next_node.data
  end

  def test_insert_adds_node_at_correct_position
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.append("dop")
    list.insert(1, "dip")

    assert_equal "dip", list.head.next_node.data
  end

  def test_insert_moves_former_occupant_to_next_node
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.append("dop")
    list.insert(1, "dip")

    assert_equal "suu", list.head.next_node.next_node.data
  end

  def test_insert_connects_to_node_before_it
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.append("dop")
    list.insert(1, "dip")

    assert_equal "dip", list.head.next_node.data
  end

  def test_find_starts_at_correct_position
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.append("dop")

    assert_equal "suu", list.find(1, 1)
  end

  def test_find_returns_correct_number_of_elements
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.append("dop")

    assert_equal "suu dop", list.find(1, 2)
  end

  def test_includes_identifies_when_elements_in_list
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.append("dop")

    assert_equal true, list.includes?("suu")
  end

  def test_includes_identifies_when_elements_not_in_list
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.append("dop")

    assert_equal false, list.includes?("wheee")
  end

  def test_pop_removes_last_element
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.append("dop")
    list.pop

    assert_equal "plop suu", list.to_string
  end

  def test_pop_returns_removed_data
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.append("dop")

    assert_equal "dop", list.pop
  end

end
