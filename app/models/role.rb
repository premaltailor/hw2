class Role < ApplicationRecord
    def movie 
        Movie.where({id: self.movie_id})[0]
    end
    def actor 
        Person.where({id: self.actor_id})[0]
    end
end
