 module RandomData
    def self.random_paragraph
     sentences = []
     rand(4..6).times do
       sentences << random_sentence
     end
 
     sentences.join(" ")
   end
   def self.random_sentence
     strings = []
     rand(3..8).times do
       strings << random_word
     end
 
     sentence = strings.join(" ")
     sentence.capitalize << "."
   end
   def self.random_word
     letters = ('a'..'z').to_a
     letters.shuffle!
     letters[0,rand(3..8)].join
   end
   #advertisement
    def self.random_price
      numbers = rand(1..9)
      price = numbers.to_s + ".00"
    end  
   def self.random_copy
      sentence = []
      rand(1..2).times do
        sentence << random_sentence
      end
    end

 end