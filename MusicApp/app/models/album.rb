# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  year       :integer          not null
#  live       :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
    validates :band_id, :title, :year, presence: true
    validates :live, presence: true, allow_nil: true

    belongs_to :band,
        foreign_key: :band_id,
        primary_key: :id,
        class_name: :Band 


    def live?
        if :live
            return "Live"
        else
            return "Studio"
        end
    end
    
end
