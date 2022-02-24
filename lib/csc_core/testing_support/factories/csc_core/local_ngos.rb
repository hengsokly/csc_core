FactoryBot.define do
  factory :local_ngo, class: 'CscCore::LocalNgo' do
    program
    name        { FFaker::Name.name }
  end
end
