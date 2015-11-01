if defined?(Rails::Server)
  scheduler = Rufus::Scheduler.new

  scheduler.every '10m' do
    $client.search("RT participa", result_type: "popular", lang: 'es').take(500).each do |tweet|
      puts "Message: #{tweet.text}"
      $client.retweet(tweet)            
    end
  end
end
