class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  before_create :create_remember_token
  # attr_accessor :name, :email
  # 
  # def initialize(attributes = {})
  #    @name  = attributes[:name]
  #    @email = attributes[:email]
  # end
  # 
  # def formatted_email
  #   "#{@name}<#{@email}>"
  # end
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50, minimum: 5}
  validates :email, presence: true,format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false}
  validates :password, length: { minimum: 6 }
  has_secure_password
  
  def User.new_remember_token
     SecureRandom.urlsafe_base64
   end

   def User.hash(token)
     Digest::SHA1.hexdigest(token.to_s)
   end

   private
   
     def create_remember_token
       
       self.remember_token = User.hash(User.new_remember_token)
     end
end
