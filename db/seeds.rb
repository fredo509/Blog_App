author_one = User.create(
  name: 'Fredo',
  photo: 'https://th.bing.com/th/id/R.7bef3acf80b4711c6de8115d2d775498?rik=oKsNFA%2flG5lGXg&riu=http%3a%2f%2fkrewfirm.files.wordpress.com%2f2010%2f07%2f2009_diary_of_a_tired_black_man_001.jpg&ehk=5HEpTg0xdXCQ3SvDtF%2brKjSoVdmZdczBl85tRTCsBks%3d&risl=&pid=ImgRaw&r=0', 
  bio: 'Developer Web.',
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

4.times do
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
end
