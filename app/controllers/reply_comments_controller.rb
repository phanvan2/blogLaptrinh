class ReplyCommentsController < ApplicationController
  before_action :set_reply_comment, only: %i[ show edit update destroy ]

  # GET /reply_comments or /reply_comments.json
  def index
    @reply_comments = ReplyComment.all
  end

  # GET /reply_comments/1 or /reply_comments/1.json
  def show
  end

  # GET /reply_comments/new
  def new
    @reply_comment = ReplyComment.new
  end

  # GET /reply_comments/1/edit
  def edit
  end

  # POST /reply_comments or /reply_comments.json
  def create
	if(session[:current_user_id]  )
		idUser = session[:current_user_id] 
		content = params[:content]
		idComment = params[:idComment]
		idBlog = params[:idBlog]
		@reply_comment = ReplyComment.new(idUser:idUser,idComment:idComment, content:content)

		respond_to do |format|
		
		if @reply_comment.save
			format.html {redirect_to "/blogs/" + idBlog, notice: "Reply comment was successfully created." }
			format.json { render :show, status: :created, location: @reply_comment }
		else
			format.html { render :new, status: :unprocessable_entity }
			format.json { render json: @reply_comment.errors, status: :unprocessable_entity }
		end
		end
	else 
		redirect_to "/" , alert: "Bạn cần đăng nhập để được bình luận." 
	end
  end

  # PATCH/PUT /reply_comments/1 or /reply_comments/1.json
  def update
    respond_to do |format|
      if @reply_comment.update(reply_comment_params)
        format.html { redirect_to @reply_comment, notice: "Reply comment was successfully updated." }
        format.json { render :show, status: :ok, location: @reply_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reply_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reply_comments/1 or /reply_comments/1.json
  def destroy
    @reply_comment.destroy
    respond_to do |format|
      format.html { redirect_to reply_comments_url, notice: "Reply comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply_comment
      @reply_comment = ReplyComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reply_comment_params
      params.require(:reply_comment).permit( :content)
    end
end
