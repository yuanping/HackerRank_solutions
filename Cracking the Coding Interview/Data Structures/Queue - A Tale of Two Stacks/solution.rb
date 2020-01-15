# Enter your code here. Read input from STDIN. Print output to STDOUT

class MyQueue

  def initialize
      @stack_in = []
      @stack_out = []
  end

  def enqueue(item)
      @stack_in << item
  end

  def dequeue
      return nil if size < 1
      shift_stack if @stack_out.empty?

      @stack_out.pop
  end

  def peek
      return nil if size < 1
      shift_stack if @stack_out.empty?

      @stack_out.last
  end

  def size
      @stack_in.size + @stack_out.size
  end

  private
  def shift_stack()
      while(!@stack_in.empty?)
          @stack_out << @stack_in.pop
      end
  end
end

n = gets.strip.to_i
q = MyQueue.new
n.times do |i|
  type = gets.rstrip.split.map(&:to_i)

  case type.first
  when 1 #enqueue
      q.enqueue type[1]
  when 2 #dequeue
      q.dequeue
  when 3 #peek
      puts q.peek
  end
end