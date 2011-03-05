class DemoController < ApplicationController
layout "admin"  
def index
   #redirect_to(:action => 'other_hello')
   #render('hello')
  end

  def hello
  @array = [1,2,3,4]
  @id= params[:id].to_i
  @page= params[:page].to_i
  #render(:text => 'Hello everyone :-)')
  end
  
  def other_hello
   render(:text => 'Hello Everyone!')
  end
end
