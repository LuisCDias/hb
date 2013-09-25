Headblendr Beta
============================

Headblendr is a 'social crowd-funding platform for Electronic Dance Music 
producers and fans'.

After signing up, a user can choose to connect her Soundcloud account in order 
to create a 'campaign'

Campaigns can be created for any track a musician has on Soundcloud or a new 
one can be uploaded to Soundcloud through Headblendr.
The metadata for the selected track will be updated, disabling the ability to 
download it directly through Soundcloud. A local representation of the 
track is stored (namely, the soundcloud id, permalink url, download url and
artwork url) in order to keep API requests to a minimum.

Each Campaign can have a number of 'Requested likes' between 1 and 25. Once this
number of 'Likes' or 'Reservations' has been achieved, the track for that
campaign will be made available for download. This is achieved by updating the
metadata on Soundcloud, enabling the direct download.

Users are encouraged to share the link to the campaign through their social
networks so as to unlock the download faster.

## Dependencies ##

Headblendr uses Ruby 2.0.0 and Rails 4.0.0. PostgreSQL is used across all
environments and has to be installed and running.

## Development setup ##

1. Clone repo
2. Run `bundle check` and, if any gems are missing from your local environment,
   run `bundle install`
3. Run `rake db:setup` to create the database and populate it with the required 
   seed data
4. The test suite can be run with `rake`. Current coverage stands at 98.66%.
5. To start the app locally, run `foreman start -p 3000`. Setting the port to
   3000 is required to be able to connect to the development app registered on Soundcloud.
6. The required ENV variables can found in `.env`. They should be correctly
   picked up in both development and test environments.

## Notes for local usage ##

The seed data provided creates the main 'genre' categories for campaigns. It
also creates a user already connected to Soundcloud. 
Please sign in with `campaign_maker@example.com`/`campaign_maker` (email/password)
to create campaigns. This user also has two tracks uploaded to Soundcloud to enable local
testing.

For convenience, a `reservation_maker@example.com`/`reservation_maker`
(email/password) has also been provided in the seed data to test reservations.

Facebook sign up/sign in does not work locally.

The status of background jobs can be checked at `localhost:3000/delayed_job`.

## Notes about the testing setup ##

In order not to hit the Soundcloud API continuously during testing, a small
Sinatra app was created at `spec/support/fake_soundcloud.rb`, supported by a
'router' (`spec/support/route_requests_to_fake_soundcloud.rb`)  and returns json
responses for the several needed requests. These responses are files served from
`spec/support/fixtures`. However brittle, this solution keeps the tests isolated 
from the network. Coming across Mystery Guests in the tests, please refer to
these fixtures for clarification.
