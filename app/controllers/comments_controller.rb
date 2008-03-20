class CommentsController < ApplicationController
  before_filter :login_required

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      render :update do |page|
        page.insert_html(:bottom, 'comments', :partial => 'comment', :object => @comment)
        page.visual_effect :highlight, 'comments', :startcolor => '#3399ff', :restorecolor => '#ffffff'
      end
    end
  end
end
