# == Schema Information
#
# Table name: item_classifications
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ItemClassification < ActiveRecord::Base
end
