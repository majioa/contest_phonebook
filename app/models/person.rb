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

  def self.import text
    csv = CSV.parse( IO.read( text[:csv].path ), :headers => true )
    ids = csv['id'].map(&:to_i)

    create_by_id(ids - Person.pluck(:id), ids, csv)

    update_by_id(Person.pluck(:id) & ids, ids, csv)

    destroy(Person.pluck(:id) - ids)
  end

  protected

  def self.create_by_id create_ids, ids, csv
    create_hashes = create_ids.map { |x| csv[ids.index(x)].to_hash }
    create_hashes.each { |x| Person.create!(x) }
  end

  def self.update_by_id update_ids, ids, csv
    update_hashes = update_ids.map { |x| csv[ids.index(x)].to_hash }
    update_hashes.each do |x|
       person = Person.find_by_id(x['id'])
       if x['updated_at'] > person.updated_at
          person.update!(x)
       end
    end
  end
end
