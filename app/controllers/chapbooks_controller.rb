class ChapbooksController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  # GET /chapbooks
  # GET /chapbooks.xml
  def index
    @chapbooks = Chapbook.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chapbooks }
    end
  end

  # GET /chapbooks/1
  # GET /chapbooks/1.xml
  def show
    @chapbook = Chapbook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chapbook }
    end
  end

  # GET /chapbooks/new
  # GET /chapbooks/new.xml
  def new
    @chapbook = Chapbook.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chapbook }
    end
  end

  # GET /chapbooks/1/edit
  def edit
    @chapbook = Chapbook.find(params[:id])
  end

  # POST /chapbooks
  # POST /chapbooks.xml
  def create
    @chapbook = Chapbook.new(params[:chapbook])

    respond_to do |format|
      if @chapbook.save
        flash[:notice] = 'Chapbook was successfully created.'
        format.html { redirect_to(@chapbook) }
        format.xml  { render :xml => @chapbook, :status => :created, :location => @chapbook }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chapbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chapbooks/1
  # PUT /chapbooks/1.xml
  def update
    @chapbook = Chapbook.find(params[:id])

    respond_to do |format|
      if @chapbook.update_attributes(params[:chapbook])
        flash[:notice] = 'Chapbook was successfully updated.'
        format.html { redirect_to(@chapbook) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chapbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chapbooks/1
  # DELETE /chapbooks/1.xml
  def destroy
    @chapbook = Chapbook.find(params[:id])
    @chapbook.destroy

    respond_to do |format|
      format.html { redirect_to(chapbooks_url) }
      format.xml  { head :ok }
    end
  end
end
