class PiedPiper::Piper
  attr_accessor :name, :url, :postion, :photo
  @@all = []


 def initialize(hash)
   hash.each do |key, value|
     self.send("#{key}=", value)
   end
 end

 def self.all
   @@all
 end

 def save
   self.class.all.push(self)
 end

 def self.create(hash)
   piper = self.new(hash)
   piper.save
   piper
 end

 def self.create_from_collection(array)
   array.each do |hash|
     self.create(hash)
   end
 end
end
