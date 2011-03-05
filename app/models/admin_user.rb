require 'digest/sha1'
class AdminUser < ActiveRecord::Base
#set_table_name("admin_users")
 has_and_belongs_to_many :pages
 has_many :section_edits
 has_many :sections, :through => :section_edits
scope :named, lambda {|first,last| where(:first_name=>first, :last_name=>last)}
 def hash(password="")
 Digest::SHA1.hexdigest(password)
 end
 def self.authenticate(username="", password="")
    user = AdminUser.find_by_username(username)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end
 def password_match?(password="")
    hashed_password == AdminUser.hash_with_salt(password, salt)
  end

 def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end
 before_save :create_hashed_password
  after_save :clear_password

def self.authenticate(username="", password="")
    user = User.find_by_username(username)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
private
  def create_hashed_password
    # Whenever :password has a value hashing is needed
    unless password.blank?
      # always use "self" when assigning values
      self.salt = User.make_salt(username) if salt.blank?
      self.password = User.hash_with_salt(password, salt)
    end
  end
  def clear_password
    # for security and b/c hashing is not needed
    self.password = nil
  end

  end

 
end
