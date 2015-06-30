# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(first: "Meir", last: "Snyder", email: "msny36@gmail.com", password: "password", location: "New York", picture: "http://api.randomuser.me/portraits/men/39.jpg", github: "msny/github.com", linkedin: "msny/linkedin.com", facebook: "msny.facebook.com", quote: "Quote this", bio: "I am a freelance web developer who specializes fixing your last developers mistakes.", skill_primary: "Javascript", skill_secondary: "Angular JS", personal_link: "Meirsnyder.com", twitter_handle: 'msny_36')

User.create(first: "Chris", last: "Black", email: "huckpilot@gmail.com", password: "password", location: "New York", picture: "http://api.randomuser.me/portraits/men/38.jpg", github: "huckpilot/github.com", linkedin: "huckpilot/linkedin.com", facebook: "huckpilot.facebook.com", quote: "I'm just here to make friends", bio: "Hi I'm chiris, I'm a fine artist, web developer and UI designer. Just relocated to LA from NYC. Feel free to contact me whenever.", skill_primary: "UI", skill_secondary: "Javascript", personal_link: "kingsizeshutyourmouth.tumblr.com", twitter_handle: 'huckpilot')

User.create(first: "Aung", last: "Barteaux", email: "aungwaran@gmail.com", password: "password", location: "New York", picture: "http://api.randomuser.me/portraits/women/39.jpg", github: "https://github.com/aung-barto", linkedin: "https://www.linkedin.com/in/aungbarteaux", facebook: "https://www.facebook.com/", quote: "say something", bio: "Hi, I'm Aung. I'm an ex-architect turned developer. ", skill_primary: "CSS", skill_secondary: "Ruby", personal_link: "aung-barto.com", twitter_handle: 'bungteaux')

User.create(first: "Paul", last: "Fielek", email: "paulfielek@gmail.com", password: "password", location: "New York", picture: "http://api.randomuser.me/portraits/men/37.jpg", github: "https://github.com/polskais1", linkedin: "https://www.linkedin.com/in/paulfielek", facebook: "https://www.facebook.com/paulfielek", quote: "Hi, I'm Paul, I'm great at react, react native, and javascript. Find me in the halls at General Assembly.", skill_primary: "Node", skill_secondary: "Rails", personal_link: "http://www.paulfielek.com", twitter_handle: 'polskais1')

User.create(first: "Molly", last: "Setzer", email: "molly.setzer@gmail.com", password: "password", location: "New York", picture: "http://api.randomuser.me/portraits/women/38.jpg", github: "https://github.com/MawlSetz", linkedin: "https://www.linkedin.com/in/MollySetzer", facebook: "https://www.facebook.com/setzerml", quote: "say something", bio: "Hi, I'm molly. I am a developer & designer living in Bushwick", skill_primary: "Javascript", skill_secondary: "Ruby", personal_link: "http://mollysetzer.squarespace.com", twitter_handle: 'mawl_setz')

User.create(first: "Jenn", last: "Smith", email: "jenn.s@gmail.com", password: "password", location: "Los Angeles", picture: "http://api.randomuser.me/portraits/women/37.jpg", github: "https://github.com/Maw", linkedin: "https://www.linkedin.com/in/MollySetzer", facebook: "https://www.facebook.com/setzerml", quote: "say something", bio: "Hi, I'm Jenn. I am a developer & foodie living in LA.", skill_primary: "Javascript", skill_secondary: "Ruby", personal_link: "http://mollysetzer.squarespace.com", twitter_handle: 'mawl_setz')

Post.create(user_id: 1, vote: 0, content: "so proud to continue to be a part of the Girl Scouts organization. Please consider donating to their fundraising campaign because this is a kick ass story.", tags: "First")
Post.create(user_id: 5, vote: 0, content: "Already been kind of a bad day and now my radio doesn't work.... I need some music blargh!", tags: "Second")
Post.create(user_id: 2, vote: 0, content: "Tonight! 
	6pm! 
	#‎NelliesTapRoom‬!
	Enjoy $10 bourbon flights, blind tastings and delicious beer as we introduce and celebrate George Remus barrel-aged cocktails! See you tonight!! ‪#‎TaftsAleHouse‬", tags: "Third")
Post.create(user_id: 1, vote: 0, content: "On the Navy Pier, in Chicago, just before our boat Architecture tour. Fun day.", tags: "Four")


Comment.create(post_id: 1, vote: 0, text: " 'https://www.indiegogo.com/.../girl-scouts-is-foreverygirl...' here is the link to donate", user_id: 1)
Comment.create(post_id: 1, vote: 0, text: "Thanks for brightening my day~!", user_id: 4)
Comment.create(post_id: 2, vote: 0, text: "This post is awesome", user_id: 4)
Comment.create(post_id: 3, vote: 0, text: "This post is awesome post 3", user_id: 2)
Comment.create(post_id: 4, vote: 0, text: "This post is awesome post 4", user_id: 1)
