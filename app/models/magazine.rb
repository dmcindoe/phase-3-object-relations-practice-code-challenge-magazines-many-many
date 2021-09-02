class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        reader_list = readers.pluck(:email)
        reader_list.join(";")
    end

    def self.most_popular
        all.max_by {|reader| reader.subscriptions.count}
    end


  
end