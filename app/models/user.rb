class User < ApplicationRecord
  include SourceableConcerns
  has_many :messages, -> { order(:created_at) }, as: :sourceable, dependent: :destroy

  before_create :assign_code

  private
  def assign_code
    self.code = generate_code User
  end
end
