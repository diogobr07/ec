class Post < ActiveRecord::Base
  include HTTParty

  base_uri 'wordpress.dev/api/core'

  attr_accessor :title, :content, :author_nickname, :author_slug, :categories, :date, :thumbnail, :slug

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
    post.author_slug = p['author']['slug']
    post.date = Date.parse(p['date'])
    post.slug = p['slug']
    post.thumbnail = p['thumbnail_images']['full']['url'] if p['thumbnail_images']
    post.categories = []
    p['categories'].each do |category|
      post.categories.push(category)
    end
    post
  end

  def self.find_by_slug(slug)
    response = self.get('/get_post', { query: {slug: slug} })
    post = self.new_post(JSON.parse(response.body)['post'])
  end
 
  def self.find(search)

    posts = {posts: []}
    query = {}
    
    query[:slug]  = search[:slug] if search[:slug]
    query[:count] = search[:count] if search[:count]
    query[:page]  = search[:page] if search[:page]

    response = self.get("/get_#{search[:by]}_posts", { query: query })
    response = JSON.parse(response.body)
    
    if(response['status'] == 'ok')
      posts[:pages] = response[:pages]
      response['posts'].each do |p|
        posts[:posts].push(self.new_post(p))
      end
    end
    
    posts

  end

  def content_preview
    content_preview = @content[0..210]
    content_preview+= "</p>"
  end

end