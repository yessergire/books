class Volume
  include ActiveModel::Model

  attr_accessor :id, :selfLink, :title, :subtitle, :publisher, :publishedDate,
                :description, :pageCount, :averageRating, :image

  def self.rendered_fields
    [:id, :selfLink, :title, :subtitle, :publisher, :publishedDate,
     :description, :pageCount, :averageRating, :image ]
  end
end