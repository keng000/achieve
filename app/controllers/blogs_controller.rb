class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blogs_params)
    if @blog.save
      redirect_to blogs_path , notice: "ブログを作成しました"
      NoticeMailer.sendmail_blog(@blog).deliver
    else
      render action: 'new'
    end
  end

  def edit
    set_blog
  end

  def update
    set_blog
    if @blog.update(blogs_params)
      @blog.update(blogs_params)
      redirect_to blogs_path, notice: 'ブログを編集しました'
    else
      render action: 'edit'
    end
  end

  def destroy
    set_blog
    @blog.destroy
    redirect_to blogs_path, notice: "削除しました"
  end

  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end

  private
    def blogs_params
      params.require(:blog).permit(:title,:content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end

end
