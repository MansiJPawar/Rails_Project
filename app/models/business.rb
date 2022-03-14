class Business < ApplicationRecord
  #Association 
  has_many :offers

  def self.to_csv(fields = column_name, options = {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |business|
        csv << business.attributes.values_at(*fields)
      end
    end
  end

  def business_name
    return self.name
  end
end