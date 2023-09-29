class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validate :age_must_be_over_13
  validate :user_must_agree_to_terms

  private

  def age_must_be_over_13
    errors.add(:base, 'Age must be over 13 to join') unless isAgeOver13
  end

  def user_must_agree_to_terms
      errors.add(:base, 'Must agree to terms and conditions') unless agreed_to_terms
  end

end

