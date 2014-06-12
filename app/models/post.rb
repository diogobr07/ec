class Post < ActiveRecord::Base
  include HTTParty

  base_uri 'wordpress.dev/api/core'

  attr_accessor :title, :content, :author_nickname, :categories, :date, :thumbnail, :slug

  has_attached_file :image, 
    :styles => { :medium => "200x200>", :thumb => "100x100>" },
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"
    
  validates :title, :body, :image, presence: true

  belongs_to :user

  # p is an post from wordpress
  def self.new_post(p)
    post = Post.new
    post.title = p['title']
    post.content = p['content']
    post.author_nickname = p['author']['nickname']
    post.date = Date.parse(p['date'])
    post.slug = p['slug']
    post.thumbnail = p['thumbnail_images']['full']['url'] if p['thumbnail_images']
    post.categories = []
    p['categories'].each do |category|
      post.categories.push(category)
    end
    post
  end

  def self.get_recent_posts
    posts = []
    response = self.get('/get_recent_posts', { query: {count: 2} })
    JSON.parse(response.body)['posts'].each do |p|
      posts.push(self.new_post(p))
    end
    posts  
  end

  def self.find_by_slug(slug)
    response = self.get('/get_post', { query: {slug: slug} })
    @post = self.new_post(JSON.parse(response.body)['post'])
  end

  def content_preview
    content_preview = @content[0..210]
    content_preview+= "</p>"
  end

end
