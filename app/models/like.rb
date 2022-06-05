class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  # post_idは一意である。一意性制約を決めるためにuser_idカラムを使用する。
  # post_idは一意であるが、それはuser_idに制約される。
  # => 一つのpostに対して一人のユーザーは一回しかlikeできない。
  validates_uniqueness_of :post_id, scope: :user_id

end
