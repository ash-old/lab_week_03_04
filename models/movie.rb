require_relative("../db/sql_runner")

class Movie

  attr_reader :id
  attr_accessor :title, :genre

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @genre = options['genre']
end

def save()
  sql = "INSERT INTO movies (title, genre) VALUES ($1, $2) RETURNING id"
  values = [@title, @genre]
  user = SqlRunner.run(sql, values).first
  @id = user['id'].to_i
end

def self.all()
    sql = "SELECT * FROM movies"
    movies = SqlRunner.run(sql)
    result = movies.map { |movies| Movie.new( movies ) }
    return result
  end

  def self.delete_all()
      sql = "DELETE FROM movies"
      SqlRunner.run(sql)
    end

  def stars()
    sql = "SELECT stars.* FROM stars INNER JOIN castings ON castings.star_id = stars.id WHERE castings.movie_id = $1"
    values = [@id]
    pg_result = SqlRunner.run(sql, values)
    stars = pg_result.map{|star_hash| Star.new(star_hash)}
    return stars
  end


end
