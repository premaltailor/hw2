# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all
Person.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model
# TODO!


# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

#People Model
ChristianBale = Person.new
ChristianBale.name = "Christian Bale"
ChristianBale.save
MichaelCaine = Person.new
MichaelCaine.name = "Michael Caine"
MichaelCaine.save
LiamNeeson = Person.new
LiamNeeson.name = "Liam Neeson"
LiamNeeson.save
KatieHolmes = Person.new
KatieHolmes.name = "Katie Holmes"
GaryOldman = Person.new
GaryOldman.name = "Gary Oldman"
GaryOldman.save
HeathLedger = Person.new
HeathLedger.name = "Heath Ledger"
HeathLedger.save
AaronEckhart = Person.new
AaronEckhart.name = "Aaron Eckhart"
AaronEckhart.save
MaggieGyllenhaal = Person.new
MaggieGyllenhaal.name = "Maggie Gyllenhaal"
MaggieGyllenhaal.save
TomHardy = Person.new
TomHardy.name = "Tom Hardy"
TomHardy.save
JosephGordonLevitt = Person.new
JosephGordonLevitt.name = "Joseph Gordon-Levitt"
JosephGordonLevitt.save
AnneHathaway = Person.new
AnneHathaway.name = "Anne Hathaway"
AnneHathaway.save
ChristopherNolan = Person.new
ChristopherNolan.name = "Christopher Nolan"
ChristopherNolan.save
christophernolan = Person.where({name: "Christopher Nolan"})[0]

#Movies Model
BatmanBegins = Movie.new
BatmanBegins.title = "Batman Begins"
BatmanBegins.year = "2005"
BatmanBegins.rated = "PG-13"
BatmanBegins.director_id = christophernolan.id
BatmanBegins.save

TheDarkKnight = Movie.new
TheDarkKnight.title = "The Dark Knight"
TheDarkKnight.year = "2008"
TheDarkKnight.rated = "PG-13"
TheDarkKnight.director_id = christophernolan.id
TheDarkKnight.save

TheDarkKnightRises = Movie.new
TheDarkKnightRises.title = "The Dark Knight Rises"
TheDarkKnightRises.year = "2012"
TheDarkKnightRises.rated = "PG-13"
TheDarkKnightRises.director_id = christophernolan.id
TheDarkKnightRises.save



#Roles Model
BruceWayne = Role.new
BruceWayne.character_name = "Bruce Wayne"
BruceWayne.save

Alfred = Role.new
Alfred.character_name = "Alfred"
Alfred.save

Ra = Role.new
Ra.character_name = "Ra's Al Ghul"
Ra.save

RachelDawes = Role.new
RachelDawes.character_name = "Rachel Dawes"
RachelDawes.save

CommissionerGordon = Role.new
CommissionerGordon.character_name = "Commissioner Gordon"
CommissionerGordon.save

Joker = Role.new
Joker.character_name = "Joker"
Joker.save

HarveyDent = Role.new
HarveyDent.character_name = "Harvey Dent"
HarveyDent.save

Bane = Role.new
Bane.character_name = "Bane"
Bane.save

JohnBlake = Role.new
JohnBlake.character_name = "John Blake"
JohnBlake.save

SelinaKyle = Role.new
SelinaKyle.character_name = "Selina Kyle"
SelinaKyle.save

puts "There are #{Movie.all.count} movies"
puts "There are #{Person.all.count} people"
puts "There are #{Role.all.count} Roles"

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!
# SELECT movies.title, movies.year_released, movies.rated, people.name 
# FROM movies INNER JOIN people ON people.id = movies.person_id;

movies = Movie.all


for m in movies
    puts "#{m.title}\t\t #{m.year}\t\t #{m.rated} \t\t #{m.director.name}"
end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!
