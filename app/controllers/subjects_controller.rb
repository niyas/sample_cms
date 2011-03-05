class SubjectsController < ApplicationController
  layout 'admin'
  def index
   list
    render('list')
   end

   def list
    @subjects=Subject.order("subjects.position ASC")
   end

   def show
    @subject=Subject.find(params[:id])
   end

   def edit
    @subject=Subject.find(params[:id])
   end

   def new
    @subjects=Subject.new
   end

   def create
    @subjects=Subject.new(params[:subject])
    if @subjects.save
      flash[:notice]="Subject Created Successfully :-)"
      redirect_to(:action=>'list')
    else
       render('new') 
    end
   end
  
   def update
         @subject=Subject.find(params[:id])
     if @subject.update_attributes(params[:subject])
      flash[:notice]="Subject Updated Successfully :-)"
      redirect_to(:action=>'show', :id=>@subject.id)
    else
       render('edit') 
    end

   end

   def delete
    @subject=Subject.find(params[:id])
   end

   def destroy
    Subject.find(params[:id]).destroy
      flash[:notice]="Subject Destroyed :-("
    redirect_to(:action=>"list")
   end
end
