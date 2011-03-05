class SectionEdit < ActiveRecord::Base
  belongs_to :editor, :class_name=>"AdminUser", :foreign_key=>"admin_user_id"
  #belongs_to :admin_user
  belongs_to :section

end
