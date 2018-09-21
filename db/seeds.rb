 require 'random_data'

 # Create Topics
 15.times do
    Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
  end
 topics = Topic.all
 # Create Posts
 50.times do
 
   Post.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"


 #create Advertisements
 10.times do
  Advertisement.create!(
    title:  RandomData.random_sentence,
    copy: RandomData.random_copy,
    price: RandomData.random_price
  )
 end
 advertisements = Advertisement.all
 
 puts "Seed finished"
 puts "#{Advertisement.count} advertisement created"

 #create Questions
 5.times do
  Question.create!(
    title: RandomData.random_question,
    body: RandomData.random_sentence
  )
  puts "Seed finished"
  puts "#{Question.count} question created"
 end

