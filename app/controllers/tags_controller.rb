class TagsController < ApplicationController
  # NOTE: Delimiter defined in environments -> initializers -> local.rb
  
  before_filter :login_required, :except => [:index, :show]
  
  def index
    @tags = Poem.tag_counts
 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end
  end
  
  def show
    @tag = params[:id]
    @poems = Poem.paginate_tagged_with @tag, :page => params[:page], :per_page => 5, :order => "created_at desc"
 
    respond_to do |format|
      format.html # show.html.erb
      format.rss { render :layout => false } # show.rss.builder
      format.xml  { render :xml => @poems }
    end
  end
end
