class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :age , numericality: { greater_than_or_equal_to: 13 }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #validate :email_has_com_domain
  # def email_has_com_domain
  #   unless email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #     errors.add(:email, "must have a '.com' domain")
  #   end
  # end

end
