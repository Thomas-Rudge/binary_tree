class Node

  attr_reader :left, :right, :value, :parent

  def initialize(*args)
    @value  = args.empty?     ? nil : args[0]
    @left   = args.length < 2 ? nil : args[1]
    @right  = args.length < 3 ? nil : args[2]
    @parent = args.length < 4 ? nil : args[3]
  end
  # Custom getter setters
  def left=(l_node)
    check_self_value
    check_is_node(l_node)
    check_node_balance(0, l_node.value)

    @left = l_node
  end

  def right=(r_node)
    check_self_value
    check_is_node(r_node)
    check_node_balance(1, r_node.value)

    @right = r_node
  end

  def value=(val)
    check_node_balance(2, val)

    @value = val
  end

  def parent=(val)
    check_is_node

    @parent = val
  end

  private

  def check_self_value
    raise ArgumentError, "a valueless node cannot have children", caller if @value.nil?
  end

  def check_is_node(object)
    raise ArgumentError, 'aurgument must be of type Node', caller if object.class != Node
  end

  def check_node_balance(pivot, val)
    case pivot
    when 0 then raise ArgumentError, "left must be less than node's value", caller if val > @value
    when 1 then raise ArgumentError, "right must be greater than node value", caller if val > @value
    when 2
      if (!@left.nil?  && !@left.value.nil?  && @left.value  > val) ||
         (!@right.nil? && !@right.value.nil? && @right.value < val)
        raise ArgumentError, "value must not be less than left, or greater than right", caller
      end
    end
  end
end
