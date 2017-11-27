class Task < ActiveRecord::Base
    belongs_to :project
    
    def mark_completed
        @completed = true
    end
    
    def complete?
        @completed
    end
end
