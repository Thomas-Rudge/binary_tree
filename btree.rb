require_relative 'node.rb'

class BinaryTree
  def initialize
    @root = Node.new
  end

  def build_tree(list)
    list.uniq! # Duplicates not supported
    @root.value = list.shift

    list.each { |item| add_node(item) } ; nil
  end

  def search(value)
    # Returns the node with the item value
    found = -1
    node  = @root

    while true
      case
      when node.value == value
        found = node
        break
      when value < node.value
        node = node.left
      when value > node.value
        node = node.right
      end

      break if node.nil?
    end

    found
  end

  def add_node(value)
    @root.value.nil? ? (@root.value = item; return) : nil

    new_node = Node.new(value)
    node     = @root

    while true
      case
      when value < node.value
        if node.left.nil?
          new_node.parent = node
          node.left       = new_node
          break
        else
          node = node.left
        end
      when value > node.value
        if node.right.nil?
          new_node.parent = node
          node.right      = new_node
          break
        else
          node = node.right
        end
      end
    end
  end

  def delete_node(value)
    node = search(value)
    return node if node == -1

    case
    when node.left.nil? && node.right.nil? then delete_leaf(node)
    when node.left.nil? then bypass_node(node, node.right)
    when node.right.nil? then bypass_node(node, node.left)
    else delete_complete_node(node)
    end

    node.left   = nil
    node.right  = nil
    node.parent = nil

    node
  end

  def level_order_traversal
    queue =  Array.new
    queue << @root

    until queue.empty?
      queue.length.times do
        node  =  queue.shift
        queue << node.left  unless node.left.nil?
        queue << node.right unless node.right.nil?
        puts node.value
      end
    end
  end

  def preorder_traversal
    traverse(0)
  end

  def inorder_traversal
    traverse(1)
  end

  def postorder_traversal
    traverse(2)
  end

  private

  def traverse(*type, node:@root)
    type = type[0]

    puts node.value if type == 0
    traverse(type, node:node.left)  unless node.left.nil?
    puts node.value if type == 1
    traverse(type, node:node.right) unless node.right.nil?
    puts node.value if type == 2
  end

  def delete_leaf(node)
    if node.parent.value > node.value # nodes a lefty
      node.parent.left = nil
    else # nodes a righty
      node.parent.right = nil
    end
  end

  def bypass_node(node, replacement)
    if node.parent.value > node.value # nodes a lefty
      node.parent.left = replacement
    else # nodes a righty
      node.parent.right = replacement
    end

    replacement.parent = node.parent
  end

  def delete_complete_node(node)
    # Get the largest valued node in the left subtree
    move_node = node.left
    until move_node.right.nil?
      move_node = move_node.right
    end
    # orphan the moving node
    move_node.parent.right = nil unless move_node.parent == node
    # Connect the moving node up where the deleted node was
    move_node.left   = node.left unless move_node.parent == node
    move_node.right  = node.right
    move_node.parent = node.parent
    # Rechild the deleted nodes parent
    if node.parent.nil?
      @root = move_node
    elsif node.parent.value > move_node.value #lefty
      node.parent.left = move_node
    else #righty
      node.parent.right = move_node
    end
  end
end
