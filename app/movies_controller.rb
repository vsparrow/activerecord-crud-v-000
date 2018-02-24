# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end

def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.create(attributes)
end

#https://apidock.com/rails/ActiveRecord/Base/create/class
# def can_be_created_in_a_block
# def can_be_created_in_a_block(block)
#   puts "??????????????????????????????????????????????????????????????????????????#{block}"
#   # Movie.create  do |m|
#   Movie.create (title :title) do |m|
#     # m.title :title
#     m.release_date :release_date
#     m.director :director
#     m.lead  :lead
#     m.in_theaters :in_theaters
#   end
# end
def can_be_created_in_a_block
  Movie.create do |m|

    m.title ="Home Alone"
    m.release_date =1990
  end
end

def can_get_the_first_item_in_the_database
  movie=Movie.first
  movie.title
  # Movie.where( id: 1)
end

def can_get_the_last_item_in_the_database
  m=Movie.last
  m.title
end

def can_get_size_of_the_database
  # Movie.read(*).size
  m_count=0
  Movie.find_each do |m|
    m_count+=1
  end
  m_count
end

def can_find_the_first_item_from_the_database_using_id
  m=Movie.find_by id: 1
  # m=Movie.first #where id: 1
  m.title
end

def can_find_by_multiple_attributes
  # title == "Title"
  # release_date == 2000
  # director == "Me"
  m=Movie.find_by title: "Title", release_date: 2000, director: "Me"
end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by
  # release date descending
  m=Movie.where("release_date > 2002").order release_date: :desc
  # m.collect {|m1,m2| m1.release_date <=> m2.release_date}

end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick"
  # m = Movie.create(title: "Awesome Flick")
  m=Movie.find_by title: "Awesome Flick"
  # movie = Movie.find(title: "Awesome Flick")
  # movie.update(title: "Even Awesomer Flick")
  # movie.save
  m.update_attribute(:title,"Even Awesomer Flick")
  # m.save
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  m=Movie.find_by title: "Wat?"
  # movie = Movie.where(title: "Wat?")
  m.update title: "Wat, huh?"
end

#https://apidock.com/rails/v4.0.2/ActiveRecord/Relation/update_all
def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  Movie.update_all title: "A Movie"
end

#https://apidock.com/rails/v4.2.7/ActiveRecord/FinderMethods/find
def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  movie_id = Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once")
  Movie.destroy(movie_id)
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.destroy_all #https://apidock.com/rails/ActiveRecord/Relation/destroy_all
end
