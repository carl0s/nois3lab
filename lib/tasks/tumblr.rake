namespace :tumblr do
  desc "Updating local blog with tumblr posts every day"
  task :sync => :environment do
    client = Tumblr::Client.new do |client|
      client.consumer_key = 'nqrv0EyDf9lnb7u6TrkPXQCf634FM1UtnYlLxgixrRS9rr5c86'
      client.consumer_secret = 'dR25RkyxEqBkZV4ryqvkPI9i458kfriCRb7TFLzXsqjq95fjBw'
      client.oauth_token = 'Rnr4sKbpr9X1B6vpC09p8FQVFbgi157KJakrYnckDMb3svap5y'
      client.oauth_token_secret = 'THgZScm3OeqHPJ0DpcRcVm9gTkRpRBrfGi5BPTgrXTIt0omp6u'
    end
    @company = Company.first
    tumblr_posts = client.posts(@company.tumblr)

    @last_post = Post.last

    if(!@last_post.nil? && tumblr_posts.response.blog['updated'] < @last_post.updated_at.to_time.to_i)
      tumblr_posts.response.posts.each do |t|
        @post = Post.new
        @post.title = t['title']
        @post.content = t['body']
        @post.tumblr_blog_name = t['blog_name']
        @post.post_type = t['type']
        @post.state = t['state']
        @post.post_url = t['post_url']
        @post.short_url = t['short_url']
        @post.save!
      end
      puts "[LOG][SUCCESS] your local is in sync with #{@company.tumblr} on Tumblr now"
    else
      puts "[LOG][WARNING] #{@company.tumblr} blog is older than your local one"
    end
  end

end
