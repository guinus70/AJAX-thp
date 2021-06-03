
class EmailsController < ApplicationController

  def new
    @emails = Email.all.find(params[:id])
  end

  def create
    @email = Email.new()
    @email.object = Faker::Color.color_name
    @email.body = Faker::GreekPhilosophers.quote
    
    if @email.save
      flash[:notice] = "Email added"
      respond_to do |format|
      	format.html { redirect_to emails_path}
      	format.js { }
      end
      
    else
    	flash[:notice] = "Please try again"
      respond_to do |format|
      	format.html { redirect_to emails_path}
      	format.js { }
      end
    end
    
  end
  
  def show
    @email = Email.find(params[:id])
    @email.update(read: true)
    respond_to do |format|
      format.html { redirect_to email_path(@email.id) }
      format.js {}
    end
  end

	def destroy
    @email = Email.find(params[:id])
	  @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
	end


  def update
    @email = Email.find(params[:id])
    @email.toggle(:read).save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end
end