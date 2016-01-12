Node = Struct.new(:data, :next)

class LinkedList

  attr_accessor :head, :last

  def initialize(first_node = nil)
    @head = first_node
    @last = first_node
  end

  def add_first_node(data)
    @head = Node.new(data, nil)
    @last = @head
  end

  def add_node(data)

    if @head.nil?
      add_first_node(data)
    else
      new_node = Node.new(data)
      @last.next = new_node
      @last = new_node

    end

    puts "Added node with value: #{data}"
  end

  def remove_node(index)
    counter = 0
    current_node = @head
    prev_node = nil

    while counter < index
      prev_node = current_node
      current_node = current_node.next
      counter += 1
    end

    # now perform the removal (cutting out current_node)
    next_node = current_node.next
    current_node.next = nil       # clear the pointer
    prev_node.next = next_node

    puts "Removed node at index #{index} with value: #{current_node.data}"
  end

  def find_node(index)
    counter = 0
    current_node = @head

    while counter < index
      current_node = current_node.next
      counter += 1
    end

    puts "Found node at index #{index} with value: #{current_node.data}"
    current_node
  end

  def print_list
    counter = 0
    current_node = @head
    loop do
      puts "Node at index #{counter}: #{current_node.data}"
      break if current_node.next.nil?
      current_node = current_node.next
      counter += 1
    end
  end

	def reverse
		counter = self.length
		new_list = LinkedList.new
		while counter > 0
			current_node = get_last	
			new_list.add_node(current_node.data)		
			remove_node(self.length)
			counter -= 1
		end
		new_list
	end

	def get_last
		current_node = @head
		loop do
			return current_node if current_node.next.nil?
			current_node = current_node.next
		end
	end

	def length
		counter = 0
		current_node = @head
		while !current_node.next.nil?
			current_node = current_node.next
			counter += 1
		end
		counter
	end
end


link = LinkedList.new
link.add_node("first")
link.add_node("second")
link.add_node("third")
print "Printing list: #{link.print_list}"
print "Reverse: #{link.reverse}"
print "Printing list: #{link.print_list}"
print link.length