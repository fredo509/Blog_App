author_one = User.create(
  name: 'Fredo',
  photo: 'https://media.licdn.com/dms/image/D4E03AQHZKJyzb2siqg/profile-displayphoto-shrink_800_800/0/1667072470390?e=1700697600&v=beta&t=8EF58YJvYUQG_bGVWDJGbCXzV_UJfHhXddKqwLurYkg', 
  bio: 'Full Stack Web Developer',
  role: 'admin', 
  email: 'fred@example.com', 
  username: 'Fred', 
  password: '123456'
)

author_two = User.create(
  name: 'Jhonny',
  photo: 'https://th.bing.com/th/id/OIP.tzJ7VBPE13IvTKlgFXNZ6AHaJ9?pid=ImgDet&w=191&h=256&c=7', 
  bio: 'Actor profesional.',
  role: 'admin', 
  email: 'jhonny@example.com', # Change the email to a unique one
  username: 'Jhon', 
  password: '123456'
)

my_post = Post.create(
  author: author_one,
  title: 'Ruby on Rails', 
  text: 'This is my favorite framework'
)

puts "Post Title: #{my_post.title}"
puts "Post Author: #{my_post.author.name}" # Use my_post.user.name to access the author's name

Comment.create(post: my_post, author: author_two, text: 'Hi Fredo!')
Comment.create(post: my_post, author: author_two, text: 'I like Ruby on Rails too!')

puts "Comments for Post: #{my_post.comments_counter}"

