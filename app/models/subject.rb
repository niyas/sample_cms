class Subject < ActiveRecord::Base

validates_presence_of:name
 has_many :pages
 scope :visible, where(:visible=>true)
 scope :invisible, where(:visible=>false)
 scope :search, lambda{|query| where(["name like ?","%#{query}%"])}
end
