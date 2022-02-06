class Movie < ApplicationRecord
    def director 
        Person.where({id: self.director_id})[0]
    end
end
