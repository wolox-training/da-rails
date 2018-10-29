class RentMailerWorker
  include Sidekiq::Worker

  Sidekiq.configure_server do |config|
    config.redis = { :namespace => 'other-stuff-filewatcher', :url => 'redis://127.0.0.1:6379'}
  end

  def perform(*args)
    RentMailer.rent_created
  end
end
