#---
# Excerpted from "Rails 5 Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/nrtest3 for more book information.
#---
class Project
  attr_accessor :tasks

  def initialize
    @tasks = []
  end

  def incomplete_tasks
    tasks.reject(&:complete?)
  end
  
  def completed_tasks
    tasks.select(&:complete?)
  end

  def done?
    incomplete_tasks.empty?
  end

  def total_size
    tasks.sum(&:size)
  end

  def remaining_size
    incomplete_tasks.sum(&:size)
  end
  
  def completed_velocity
    tasks.sum(&:points_toward_velocity)
  end
  
  def current_rate
  end
end
