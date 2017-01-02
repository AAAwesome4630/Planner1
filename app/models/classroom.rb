class Classroom < ActiveRecord::Base
    belongs_to :teacher
    
    has_many :sc_relationships
    
    has_many :tests
    has_many :assignments
    has_many :t_files
    
    def self.search(search)
      where("name LIKE ?", "%#{search}%") 
    end
    
end
