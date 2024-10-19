class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_error

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  before_destroy :ensure_no_bookmarks

  private

  def ensure_no_bookmarks
    if bookmarks.any?
      errors.add(:base, "Cannot delete movie while bookmarks exist")
      throw(:abort)
    end
  end
end
