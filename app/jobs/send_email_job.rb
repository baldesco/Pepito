class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(client)
  	RegiserMailer.register(client).deliver_later
    # Do something later
  end
end
