class ContactMailerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "hi"
  end
end
