$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
#binding.pry

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end
################################
def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end
#############################
def list_of_directors(source)
  dir_ls=[]
  dir_ls_i=0
  while dir_ls_i<source.length
  dir_ls << source[dir_ls_i][:name]
  dir_ls_i+=1
  end
  dir_ls
end
#############################
def total_gross(source)
  # Write this implementation
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
    i = 0
    total = 0
    # Should use methods:
    # 1. directors_totals: returns a Hash of { dir_name => gross }
    # 2. list_of_directors: names provides an Array of directors names (use
    dir_total = directors_totals(source) # hash that saves total earnings of each director
    dir_list = list_of_directors(source) # hash that saves director names
    while i < dir_list.length do
      total += dir_total[dir_list[i]]
      i += 1
    end
    total
  end
