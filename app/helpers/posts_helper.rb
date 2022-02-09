module PostsHelper
    def render_with_hashtags(tag)
       tag.gsub(/#\w+/){|word| link_to word, "/posts/hashtag/#{word.delete('#')}"}.html_safe
    end
end
