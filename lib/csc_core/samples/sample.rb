# frozen_string_literal: true

Dir["/app/lib/builders/*.rb"].sort.each { |file| require file }
Dir["/app/lib/exporters/*.rb"].sort.each { |file| require file }

# References
require_relative "base"
require_relative "user"
require_relative "program"
require_relative "pdf_template"
require_relative "primary_school"
require_relative "location"
require_relative "category"
require_relative "dataset"
require_relative "profile"

require_relative "local_ngo"
require_relative "caf"

require_relative "educational_background"
require_relative "scorecard_knowledge"

require_relative "indicator"
require_relative "facility"
require_relative "language"
require_relative "rating_scale"

# For scorecard
require_relative "scorecards/participant"
require_relative "scorecards/voting_indicator"
require_relative "scorecards/rating"
require_relative "scorecards/raised_indicator"
require_relative "scorecards/scorecard_reference"
require_relative "scorecard"
