class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc {|attributes| attributes['content'].blank?}

  def username
    self.user.username if self.user
  end
end
