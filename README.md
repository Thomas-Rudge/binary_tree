# Binary Tree

A library to create and maintain ordered binary trees.

The tree...
  * ...can only hold sortable values (e.g. numbers).
  * ...cannot hold duplicates.

---

###Example

####Creating Tree
In the below example we will build the following tree...
```shell
        7
       / \
      /   \
     /     \
    3       9
   / \     / \
  /   \   /   \
 1     5 8     10
  \   / \
   2 4   6
       
```
&nbsp;

```ruby
require 'btree'

tree = BinaryTree.new
 => #<BinaryTree:0x000000021997c0 @root=#<Node:0x00000002199798 @value=nil, @parent=nil, @left=nil, @right=nil>>

# Note that a sorted list will create a degenerate tree
data = [7, 3, 9, 1, 8, 5, 10, 6, 4, 2]
tree.build_tree(data)
 => nil

tree.root.value
 => 7

tree.root.left.value
 => 3
# A search will return the entire tree from the searched node's perspective
tree.search(5)
 => #<Node:0x00000001f53240 @value=5, @parent=#<Node:0x00000001f537e0 @value=3, @parent=#<Node:0x0000...etc, etc
```
---
&nbsp;
####Traversing Tree
```ruby
tree.level_order_traversal
7
3
9
1
5
8
10
2
4
6
 => nil 

tree.preorder_traversal
7
3
1
2
5
4
6
9
8
10
 => nil 

tree.inorder_traversal
1
2
3
4
5
6
7
8
9
10
 => nil 

tree.postorder_traversal
2
1
4
6
5
3
8
10
9
7
 => nil
```
---
&nbsp;
####Adding nodes.
```ruby
tree.add_node(15)
 => nil 
tree.add_node(-3)
 => nil 
tree.add_node(12)
 => nil 
tree.add_node(-1)
 => nil
```
The tree will now look like this...
```shell
          7
         / \
        /   \
       /     \
      3       9
     / \     / \
    /   \   /   \
   1     5 8     10
  / \   / \       \
-3   2 4   6      15
  \               /
  -1             12
```
```ruby
tree.level_order_traversal
7
3
9
1
5
8
10
-3
2
4
6
15
-1
12
 => nil

tree.search(-3).right.value
 => -1 
tree.search(15).left.value
 => 12 
```
&nbsp;
---
####Deleting nodes
```ruby
# Delete a node with a single child
tree.delete_node(10)
 => #<Node:0x0000000226ef60 @value=10, @parent=nil, @left=nil, @right=nil> 

tree.level_order_traversal
7
3
9
1
5
8
15
-3
2
4
6
12
-1
 => nil

# Delete a node with two children
tree.delete_node(1)
 => #<Node:0x0000000226f0f0 @value=1, @parent=nil, @left=nil, @right=nil>

tree.level_order_traversal
7
3
9
-1
5
8
15
-3
2
4
6
12
 => nil

# Delete a leaf
tree.delete_node(4)
 => #<Node:0x0000000226ee48 @value=4, @parent=nil, @left=nil, @right=nil> 

tree.level_order_traversal
7
3
9
-1
5
8
15
-3
2
6
12
 => nil 

# Delete the root
tree.delete_node(7)
 => #<Node:0x000000022a09e8 @value=7, @parent=nil, @left=nil, @right=nil>

tree.level_order_traversal
6
3
9
-1
5
8
15
-3
2
12
 => nil 
```
