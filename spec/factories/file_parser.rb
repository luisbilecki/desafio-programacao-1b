FactoryBot.define do
  factory :file_parser do
    skip_create

    content {File.read(File.join(Rails.root, '/spec/fixtures/files/testfile.txt'))}
    initialize_with { new(content) }
  end
end
