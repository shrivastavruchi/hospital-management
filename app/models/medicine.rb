class Medicine < ActiveRecord::Base
require 'csv'
require 'rails/all'

validates :expire_date,:quantity,:charges,:medicine_name ,:presence=>true


	def self.to_csv
	 	CSV.generate do |csv|
      csv << column_names
      all.each do |medicine|
        csv << medicine.attributes.values_at(*column_names)
      end
    end
	end	
end
