require_relative('models/casting')
require_relative('models/movie')
require_relative('models/star')

require('pry')

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

movie1 = Movie.new({'title' => 'Short Circuit 2', 'genre' => 'comedy'})
movie1.save()
movie2 = Movie.new({'title' => 'Spinal Tap', 'genre' => 'comedy'})
movie2.save()

star1 = Star.new({'first_name' => 'Michael', 'last_name' => 'McKean'})
star1.save()

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' =>200000})
casting1.save()



binding.pry
nil
