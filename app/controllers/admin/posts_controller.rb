class Admin::PostsController < Admin::ApplicationController
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to admin_posts_path, notice: 'Novo Post criado!'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to admin_posts_path, notice: 'Post atualizado'
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: 'Post excluido'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :published)
  end

end
