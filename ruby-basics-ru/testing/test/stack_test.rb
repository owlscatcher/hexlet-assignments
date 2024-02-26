# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
    @element = 'ruby'
  end

  def test_add_element_to_stack
    assert { @element == @stack.push!(@element).last }
  end

  def test_delete_element_from_stack
    @stack.push!(@element)
    assert { @stack.pop! == @element }
  end

  def test_clear_stack
    assert { @stack.clear!.empty? }
  end

  def test_should_be_empty
    assert { @stack.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
