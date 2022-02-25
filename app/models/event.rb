class Event < ApplicationRecord

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: 'User', dependent: :destroy

=begin 
  validates :start_date,
   presence: true

  
  validate :start_date_cannot_be_in_the_past
  #impossible de créer ou modifier un évènement dans le passé
      def start_date_cannot_be_in_the_past
        if start_date < Date.current
         errors.add(:start_date, "L'évènement doit avoir une date supérieur à la date du jour")
       end
      end    


  validates :duration,
    presence: true,
    #strictement positif
    numericality: {greater_than_or_equal_to: 0}
    #nb minutes doit être un multiple de 5 
  validate :multiple_by_5
      def multiple_by_5
        unless duration.to_i%5 == 0
          errors.add(:duration, "la durée doit être un multiple de 5")
        end
      end

  validates :title,
    presence: true,
    length: {minimum: 5, maximum: 140}

  validates :description,
    presence: true,
    length: {minimum: 20, maximum: 1000}

  validates :price,
    presence: true,
    #doit être compris entre 1 et 1000
    numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}

  validates :location,
    presence: true
=end

end
