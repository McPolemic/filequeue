class FileQueue
	attr_accessor :file_name, :delimiter
	
  def initialize(file_name, delimiter="\n")
    @delimiter = delimiter
    @file_name = file_name
  end

  def push(obj)
    if obj.match Regexp.new @delimiter
      raise "Queue objects cannot contain the queue delimiter"
    end
    safe_open 'a' do |file|
      file.write(obj + @delimiter)
    end
  end

  alias << push
	
  def pop
    value = nil
    rest = nil
    safe_open 'r' do |file|
      value = file.gets @delimiter
      rest = file.read
    end
    safe_open 'w+' do |file|
      file.write rest
    end
    value ? value[0..-(@delimiter.length) - 1] : nil
  end

  def length
    count = 0
    safe_open 'r' do |file|
      count = file.read.count @delimiter
    end
    count
  end

  def empty?
    return length == 0
  end

  def clear
    safe_open 'w' do |file| end
  end
	
  private
  def safe_open(mode)
    File.open(@file_name, mode) do |file|
      file.flock File::LOCK_EX
      yield file
      file.flock File::LOCK_UN
    end
  end
end