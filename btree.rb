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

  def search(item)
    # Returns the node with the item value
    found = -1
    node  = @root

    while true
      case
      when node.value == item
        found = node
        break
      when item < node.value
        node = node.left
      when item > node.value
        node = node.right
      end

      break if node.nil?
    end

    found
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
end
