class Classroom < ActiveRecord::Base
    belongs_to :teacher
    
    has_many :sc_relationships
    
    has_many :tests
    has_many :assignments
    
    def self.search(search)
      where("name LIKE ?", "%#{search}%") 
    end
    
end
