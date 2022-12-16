class Contact < MailForm::Base
  attribute :name
  attribute :email
  attribute :message

  validates :email, length: { maximum: 255 }, format: URI::MailTo::EMAIL_REGEXP

  validates_presence_of :name, :email, :message

  def headers
    {
      :subject => "Contact Form Inquiry",
      :to => "t@earthling.se",
      :from => %("#{name}" <#{email}>)
    }
  end
end