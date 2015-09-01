require 'minitest'
require_relative '../lib/node'

module LinkedList
  class NodeTest < Minitest::Test

    def test_the_node_has_a_value
     node = Node.new(0)
     assert_equal 0, node.value
    end

    def test_the_node_knows_that_its_the_tail
      node = Node.new(0)
      assert_equal true, node.tail?
    end

  end
end
