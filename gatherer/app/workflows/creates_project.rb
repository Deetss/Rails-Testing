class CreatesProject
  attr_accessor :name, :project, :task_string

  def initialize(name: '', task_string: '')
    @name = name
    @task_string = task_string
    @success = false
  end

  def build
    self.project = Project.new(name: name)
    project.tasks = convert_string_to_tasks
    project
  end

  def create
    build
    @success = project.save
  end

  def success?
    @success
  end

  def convert_string_to_tasks
    @task_string.split("\n").map do |one_task|
      title, size_string = one_task.split(':')
      Task.new(title: title, size: size_as_integer(size_string))
    end
  end

  def size_as_integer(size_string)
    if size_string.nil? || size_string.to_i < 1
      1
    else
      size_string.to_i
    end
  end
end
