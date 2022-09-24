class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        Freebie.create(dev: dev, company: self, item_name: item_name, value: value)
    end

    def self.oldest_company
        self.all.sort{|a,b| a.founding_year <=> b.founding_year}.first
    end
end
