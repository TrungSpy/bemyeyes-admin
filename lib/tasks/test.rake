namespace :test do
  desc "TODO"
  task create_user: :environment do
    user = User.new
    user.email = 'someoneelse@example.com'
    user.password = 'foobar'
    user.first_name = 'someone'
    user.last_name = 'example'
    user.role = 'helper'
    user.save!
  end

end
