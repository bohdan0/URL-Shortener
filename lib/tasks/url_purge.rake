namespace :URLShortener do
  desc "Prune urls"
  task prune_urls: :development do
    puts "Prune old urls..."
    ShortenedUrl.prune(10)
  end
end
