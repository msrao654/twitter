require 'rubygems'
require 'twitter'
hash_tag = ARGV.first

if hash_tag.nil?
  puts "Please provide tag you want to fetch."
  exit
end
puts 'fetching......'
begin
  tweets = Twitter::Search.new.hashtag(hash_tag)
rescue Exception => e
  # Time out or any other error can occur here
  puts "Errors in fetching tweets #{e}"
end
links = []
tweets.each do |tweet|
  links << tweet.text.match(/\bhttps?:\/\/\S+\b/)
end
links = links.uniq
puts links