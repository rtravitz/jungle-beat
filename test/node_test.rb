require "./lib/node"
require "minitest/autorun"
require "minitest/pride"

class NodeTest < Minitest::Test

  def test_a_node_can_be_created
    node = Node.new("Legolas")

    assert_equal Node, node.class
    assert_equal "Legolas", node.data
  end

  def test_a_node_can_hold_different_data
    node = Node.new("Frodo")

    assert_equal "Frodo", node.data
  end

  def test_next_node_is_nil_by_default
    node = Node.new("Aragorn")

    assert_equal nil, node.next_node
  end

end
