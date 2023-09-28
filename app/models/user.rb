class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validate :age_must_be_over_13,

  private

  def age_must_be_over_13
    errors.add(:base, 'Age must be over 13 to join') unless isAgeOver13
  end

  def agreed_to_terms
    unless agreed_to_terms?
      errors.add(:agreed_to_terms, 'Must agree to terms and conditions')
    end
  end

  def agreed_to_terms?
    # Check if the agreed_to_terms checkbox is checked
    agreed_to_terms.present? && agreed_to_terms == '1'
  end
end

