require 'minitest'
require_relative '../lib/list'
require_relative '../lib/node'

module LinkedList
  class ListTest < Minitest::Test

    def setup
      @list = LinkedList::List.new()
      @node_1 = LinkedList::Node.new(1)
      @node_2 = LinkedList::Node.new(2)
      @node_3 = LinkedList::Node.new(3)
      @node_4 = LinkedList::Node.new(4)
    end

    def test_the_head_is_nil_for_an_empty_list
     assert_equal nil, @list.head
    end

    def test_an_appended_node_can_become_the_head
     @list.append(@node_1)
     assert_equal @node_1, @list.head
    end

    def test_a_node_can_be_appended_to_a_list
      @list.append(@node_1)
      assert @node_1.tail?
      @list.append(@node_2)
      @list.append(@node_3)
      assert_equal @node_2, @node_1.following
      assert_equal @node_3, @node_2.following
    end

    def test_we_can_prepend_a_node_to_an_empty_list
      @list.prepend(@node_1)
      assert_equal @node_1, @list.head
    end

    def test_we_can_prepend_a_node_to_a_populated_list
      @list.append(@node_1)
      assert_equal @node_1, @list.head
      @list.prepend(@node_2)
      assert_equal @node_2, @list.head
      assert_equal @node_1, @list.head.following
    end

    def test_we_can_insert_values_into_an_empty_list
      @list.insert(@node_1, 0)
      assert_equal @node_1, @list.head
    end

    def test_we_can_use_insert_to_place_a_value_to_the_head
      @list.append(@node_1)
      @list.insert(@node_2, 0)
      assert_equal @node_2, @list.head
    end

    def test_we_can_insert_an_element_at_an_arbitrary_position
      @list.append(@node_1)
      @list.append(@node_2)
      @list.append(@node_3)
      @list.insert(@node_4, 2)
      assert_equal @node_3, @list.head.following.following
    end

    def test_we_can_check_if_a_node_contains_a_specified_value
      @list.append(@node_1)
      @list.append(@node_2)
      @list.append(@node_3)
      assert_equal 2, @list.head.following.value
      assert @list.includes?(2)
    end

    def test_returns_false_if_queried_value_is_not_in_the_list
      @list.append(@node_1)
      refute @list.includes?(3)
    end

    def test_wont_throw_error_when_searching_and_empty_list
      refute @list.includes?(3)
    end

    def test_it_pops
      @list.append(@node_1)
      @list.append(@node_2)
      @list.append(@node_3)
      assert_equal @node_3, @node_2.following
      @list.pop
      assert_equal nil, @node_2.following
    end

    def test_it_pops_a_list_with_one_value
      @list.append(@node_1)
      @list.pop
      assert_equal nil, @list.head
    end

    def test_wont_break_when_popping_an_empty_list
      @list
      assert_equal "Can't pop an empty list", @list.pop
    end

    def test_calling_count_will_notify_us_if_list_is_empty
      @list
      assert_equal "The list is empty", @list.count
    end

    def test_calling_count_will_work_for_a_list_of_3
      @list.append(@node_1)
      @list.append(@node_2)
      @list.append(@node_3)
      assert_equal 3, @list.count
    end

    def test_head_value_will_return_message_if_querying_an_empty_list
      @list
      assert_equal  "The list is empty", @list.head_value
    end

    def test_the_value_inside_the_first_node_is_returned_when_the_head_value_method_is_called
      @list.append(@node_1)
      @list.head_value
      assert_equal 1, @list.head_value
    end

    def test_tail_value_will_return_message_if_querying_an_empty_list
      @list
      assert_equal "There is no tail - the list is empty.", @list.tail_value
    end

    def test_tail_value_is_returned_properly
      @list
      @list.append(@node_1)
      @list.append(@node_2)
      @list.append(@node_3)
      assert_equal 3, @list.tail_value
    end

    def test_find_by_index_throws_a_message_if_empty_list
      @list
      assert_equal "The list is empty", @list.find_by_index(0)
    end

    def test_find_by_index_will_return_the_value_of_the_head_node
      @list
      @list.append(@node_1)
      assert @node_1.value == 1
      assert_equal 1, @list.find_by_index(0)
    end

    def test_find_by_index_will_return_the_value_of_a_node_in_the_list
      @list.append(@node_1)
      @list.append(@node_2)
      @list.append(@node_3)
      assert @node_2.value == 2
      assert_equal 2, @list.find_by_index(1)
    end

    def test_find_by_index_will_alert_if_location_is_not_in_list
      @list.append(@node_1)
      assert_equal "location doesn't exist", @list.find_by_index(100)
    end

    def test_find_by_value_will_throw_a_message_if_empty_list
      @list
      assert_equal "The list is empty", @list.find_by_value(0)
    end

    def test_find_by_value_will_return_the_first_position_of_that_value
      @list.append(@node_1)
      @list.append(@node_2)
      @list.append(@node_3)
      assert @node_3.value == 3
      assert_equal 2, @list.find_by_value(3)
    end

    def test_find_by_value_will_return_alert_if_value_not_in_list
      @list.append(@node_1)
      @list.append(@node_2)
      assert_equal "value doesn't exist", @list.find_by_value(99)
    end

    def test_remove_by_index_works_for_head_at_0
      @list.append(@node_1)
      @list.append(@node_2)
      @list.remove_by_index(0)
      assert_equal @node_2, @list.head
    end

    def test_remove_by_index_works_for_any_value_that_exists_in_list
      @list.append(@node_1)
      @list.append(@node_2)
      @list.append(@node_3)
      assert @list.head.following == @node_2
      @list.remove_by_index(1)
      assert_equal @node_3, @list.head.following
    end

    def test_remove_index_will_alert_if_location_doesnt_exist
      @list.append(@node_1)
      @list.append(@node_2)
      assert_equal "location doesn't exist", @list.remove_by_index(100)
    end

    def test_remove_by_value_will_remove_head
      @list.append(@node_1)
      @list.append(@node_2)
      assert @node_1.value == 1
      assert @list.head.value == 1
      @list.remove_by_value(1)
      assert @node_2.value == 2
      assert_equal 2, @list.head.value
    end

    def test_remove_by_value_will_remove_existing_value
      @list.append(@node_1)
      @list.append(@node_2)
      @list.append(@node_3)
      assert @node_2.value == 2
      assert @list.head.following.value == 2
      @list.remove_by_value(2)
      refute @list.head.following.value == 2
      assert_equal 3, @list.head.following.value
    end

    def test_remove_by_value_will_alert_if_value_doesnt_exist
      @list.append(@node_1)
      @list.append(@node_2)
      assert_equal "value doesn't exist", @list.remove_by_value(100)
    end

  end
end
