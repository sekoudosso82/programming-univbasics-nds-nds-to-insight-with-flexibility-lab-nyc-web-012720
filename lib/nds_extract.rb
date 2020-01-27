# Provided, don't edit
require 'directors_database'


def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


def movies_with_director_key(name, movies_collection)
 
  index = 0 
  result = []
  
  while index < movies_collection.length do 
    result.push(movie_with_director_name(name,movies_collection[index]))
    index += 1 
  end
 
  result
  
end

def gross_per_studio(collection)
  result = {}
  i = 0
  total = 0

  while i < collection.length do
    studio_name = collection[i][:studio]
    gross = collection[i][:worldwide_gross]
    
        if !result[studio_name]
          result[studio_name] = collection[i][:worldwide_gross]
        else
          result[studio_name] += collection[i][:worldwide_gross]
        end
    i += 1
  end

  result

  
end



def movies_with_directors_set(source)
  # puts "********* source"
  #         puts source[0]  
  
  index = 0
  director_array = []
  hash = {}

    while index < source.length do
          name = (source[index][:name])
          
          movie_index = 0 
          movie = (source[index][:movies])
          
          while movie_index<movie.length do
            movie[movie_index][:director_name] = name 
            movie_index +=1
          end 
         
          director_array[index] =  movie
          
          
          index += 1
    end

  director_array
  

end



def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end


