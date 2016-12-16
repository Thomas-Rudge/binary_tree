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

  def print_tree_sequence
    # Level order traversal
    # Preorder traversal
    # Inorder traversal
    # Postorder traversal
  end

  def breadth_first_search(item)
  end

  def depth_first_search(item)
  end

  def depth_first_search_rec(item)
  end

  def add_node(item)
    @root.value.nil? ? (@root.value = item; return) : nil

    new_node = Node.new(item)
    node     = @root

    while true
      case
      when item < node.value
        if node.left.nil?
          new_node.parent = node
          node.left       = new_node
          break
        else
          node = node.left
        end
      when item > node.value
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
end
