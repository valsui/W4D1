# == Schema Information
#
# Table name: artworks
#
#  id        :bigint(8)        not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#

class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :artist_id, uniqueness: {scope: :title, message: "should have unique titles for their arts."}

  belongs_to :artist,
  primary_key: :id,
  foreign_key: :artist_id,
  class_name: :User
  
end