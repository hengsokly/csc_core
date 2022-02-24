def fixture_image_path(filename)
  "#{CscCore::Engine.root}/lib/csc_core/testing_support/fixtures/images/#{filename}"
end

def fixture_attachment_path(filename)
  "#{CscCore::Engine.root}/lib/csc_core/testing_support/fixtures/attachment/#{filename}"
end

Dir["#{File.dirname(__FILE__)}/factories/**/*"].each do |f|
  require File.expand_path(f) if File.file?(f)
end
