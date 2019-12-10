# Viability comparison API

A backend API that serves up viability assessment data for comparison. It:

* Has a (WIP) database of viability appraisals (seeded from csv file) - some data is made up for testing purposes.
* Makes this data available for separate front-end applications to request.
* Has several filtering options.

Built with Rails (6.0.0).

## Prerequisites

* Ruby (2.6.0)
* Postgres

## Running it locally

1. Clone repo and run `bundle install`
2. Set up database by running `rake db:create`, `rake db:migrate` and then `rake db:seed`
3. Then you should be good to run a server with `rails s`

## Running it on the web

We use Heroku.

## Usage (for front-end applications)

Use the following path to request all viability appraisals:
* `/viability_appraisals`

Filter by ID:
* `/viability_appraisals/:id`

You can also filter using the following parameters:
* `min_habitable_rooms` - maximum number of habitable rooms
* `max_habitable_rooms` - minimum number of habitable rooms
* `min_residential_units` - minimum number of residential units
* `max_residential_units` - maximum number of residential units
* `min_stories` - minimum number of storeys
* `max_stories` - maximum number of storeys
* `min_gdv` - minimum GDV in £
* `max_gdv` - maximum GDV in £
* `commercial` - properties with or without commerical space - can be `true` or `false`
* `directional_sort` - Order results by a field eg `-habitable_rooms` The '-' symbol means descending, without is ascending.

An example request with filtering might be:
`localhost:300/viability_appraisals?min_habitable_rooms=100&max_habitable_rooms=200&commercial=true`
