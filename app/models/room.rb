class Room < ApplicationRecord
  before_create do
    # create a session id
    # instantiate opentok API
    # WARNING - in tutorial vonage_api_key and vonage_api_secret were stored in credentials.yml.enc and not .env like I did
    #  WARNING - in tutorial Rails.application.credentials.vonage_api_key Rails.application.credentials.vonage_api_secret
    opentok = OpenTok::OpenTok.new Rails.application.env.vonage_api_key, Rails.application.env.vonage_api_secret
    # this gives us a client that we can use to create a session id in our database and save that to
    session = opentok.create_session
    self.vonage_session_id = session.session_id
  end
end
