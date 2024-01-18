class ForumThreadsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_forum_thread, except: [:index, :new, :create]

  def index
    @q = ForumThread.ransack(search_params_subject)


    @threads = @q.result
    forum_thread_ids = []
    # if (params.dig(:query, :forum_category_id).present?) && (params.dig(:query, :forum_category_id) != "")
    #   @threads = search_categories
    # else
    @threads.each do |t|
      forum_thread_ids << t.id
      forum_thread_ids = forum_thread_ids + search_comments
    end

    if params[:forum_category_id].present? # Обработка запроса из формы
      @threads = ForumThread.where(forum_category_id: params[:forum_category_id])
      respond_to do |format|
        format.html
        format.json { render json: @forum_threads }
      end
    else
      @threads = ForumThread.where(id: forum_thread_ids)
    end
  end

  def show
    @forum_post = ForumPost.new
  end

  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.new
  end

  def create
    p params[:forum_category_id]
    @forum_thread = current_user.forum_threads.new forum_thread_params
    @forum_thread.forum_posts.first.user_id = current_user.id

    if @forum_thread.save
      redirect_to @forum_thread
    else
      render action: :new
    end
  end

  private

    def search_params_subject
      params.dig(:query, :subject) ? { subject_cont: params[:query][:subject] } : {}
    end

    def search_params_body
      params.dig(:query, :subject) ? { body_cont: params[:query][:subject] } : {}
    end

    def search_params_forum_category_id
      params.dig(:query, :forum_category_id) ? { forum_category_id_eq: params[:query][:forum_category_id] } : {}
    end

    def search_categories
      forum_categories_ids = []
      @qu = ForumThread.ransack(search_params_forum_category_id)
      @r = @qu.result
    end

    def search_comments
      forum_thread_ids = []
      @qu = Comment.ransack(search_params_body)
      @comments = @qu.result
      @comments.each do |c|
        forum_thread_ids << c.forum_thread_id
      end
      return forum_thread_ids
    end

    def set_forum_thread
      @forum_thread = ForumThread.find(params[:id])
    end

    def forum_thread_params
      params.require(:forum_thread).permit(:subject, :forum_category_id, forum_posts_attributes: [:body])
    end
end