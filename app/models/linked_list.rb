class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end

  def insert(index, data)
    if @head.present? && @tail.present?
      if index == 0
        prepend(data)
      elsif index == @size
        append(data)
      else
      current = @head
      (index - 1).times do
        current = current.next_node
      end
      tmp = current.next_node
      current.next_node = Node.new(data)
      current.next_node.next_node = tmp
      end
    else
      @head = Node.new(data)
      @tail = @head
    end
    @size += 1
  end

  def delete(index)
    current = @head
    (index - 1).times do
      current = current.next_node
    end
    current.next_node = current.next_node.next_node
  end

  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
      @tail = @head
    else
      tmp_head = @head
      @head = Node.new(data)
      @head.next_node = tmp_head
    end
    @size += 1
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
      @tail = @head
    else
      @tail.next_node = Node.new(data)
      @tail = @tail.next_node
    end
    @size += 1
  end
end
