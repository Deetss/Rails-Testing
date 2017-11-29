#---
# Excerpted from "Rails 5 Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/nrtest3 for more book information.
#---
class Project
  attr_accessor :tasks, :due_date

  def initialize
    @tasks = []
    @due_date = nil
  end
  
  def self.velocity_lenght_in_days
    21
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
    completed_velocity.to_f / Project.velocity_lenght_in_days
  end
  
  def projected_days_remaining
    remaining_size / current_rate
  end
  
  def projected_end_date
    (Time.now + projected_days_remaining.days)
  end
  
  
  def on_schedule?
    return false if projected_days_remaining.nan?
    projected_end_date <= due_date
  end
end
