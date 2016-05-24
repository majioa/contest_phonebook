require 'csv'

class Person < ActiveRecord::Base
  validates :fullname, presence: true

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |person|
        csv << person.attributes.values_at(*column_names)
      end
    end
  end
end
