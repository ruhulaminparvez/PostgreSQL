from movie import Movie
from user import User

user = User("Ruhul")

my_movies = Movie("Stranger Things", "Sci-fi")

print(my_movies.name)
print(my_movies.genre)

print(user)

user.movies.append(my_movies)
print(user.movies)

