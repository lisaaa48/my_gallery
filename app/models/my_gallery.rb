class MyGallery < ApplicationRecord

  belongs_to :user
  belongs_to :work

  acts_as_taggable_on :tags # post.label_list が追加される: post.label_list
  acts_as_taggable # acts_as_taggable_on :tags のエイリアス: post.tag_list

end
