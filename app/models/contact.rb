class Contact < ApplicationRecord
  belongs_to :kind # , optional: true
  has_many :phones
  has_one :address
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true
  
  #   def to_br
  #     {
  #       name: name,
  #       email: email,
  #       nascimento: (I18n.l(birthdate) unless birthdate.blank?)
  #     }
  #   end

  #   def birthdate_br
  #      I18n.l(self.birthdate) unless self.birthdate.blank?
  #   end

  # def author
  #    "Thomé Lucas A. Oliveira"
  # end

  def as_json(options = {})
    h = super(options)
    h[:birthdate] = I18n.l(birthdate) unless birthdate.blank?
    h
  end

  #   def hello
  #     I18n.t('hello')
  #   end

  #   def local
  #     I18n.default_locale
  #   end
end
