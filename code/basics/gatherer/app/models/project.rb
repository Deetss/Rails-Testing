class Project < ActiveRecord::Base
    has_many :tasks
    
    def incomplete_tasks
        tasks.where(completed = false)
    end
    
    def done?
        incomplete_tasks.empty?
    end
    
    def total_size
        tasks.each.sum(&:size)
    end
    
    def remaining_size
       incomplete_tasks.sum(&:size)
    end
end

