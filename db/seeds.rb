# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Don't seed data for production environment just now!

include Rails.application.routes.url_helpers

if Rails.env.eql?("development")
  # users
  user_one = User.create(name: "ChilliBean Administrator", email: "admin@chillipharm.com", password: "Testingtest123", password_confirmation: "Testingtest123")
  user_two = User.create(name: "Joe Bloggs", email: "joe@chillipharm.com", password: "Testingtest123", password_confirmation: "Testingtest123")
  user_three = User.create(name: "Wanda Bloggs", email: "wanda@chillipharm.com", password: "Testingtest123", password_confirmation: "Testingtest123")

  # Libraries
  first_library = Library.create(name: "A Populated Library", creator: user_one)
  second_library = Library.create(name: "Other Library", creator: user_one)

  # Asset 1
  video_asset_one = Asset.create(filename: "trial 106.mov", title: "Trial 106", filesize: 100.megabytes, file_type: Asset.file_types[:video], uploader: user_two, library: first_library, created_at: 2.weeks.ago)
  comment = video_asset_one.comments.build(comment: "Evaluators comments", author: user_two)
  comment.save
  comment = video_asset_one.comments.build(comment: "Evaluators comments reply", author: user_three)
  comment.save

  # Asset 2
  video_asset_two = Asset.create(filename: "trial 107.mov", title: "Trial 107", filesize: 100.megabytes, file_type: Asset.file_types[:video], uploader: user_two, library: first_library, created_at: 1.weeks.ago)
  comment = video_asset_two.comments.build(comment: "Evaluators comments", author: user_two)
  comment.save
  comment = video_asset_two.comments.build(comment: "Evaluators comments reply", author: user_three)
  comment.save

  # Asset 3
  image_asset = Asset.create(filename: "image.jpg", title: "MRI 003", filesize: 2.megabytes, file_type: Asset.file_types[:image], uploader: user_two, library: first_library, created_at: 4.days.ago)

  # Asset 4
  audio_asset = Asset.create(filename: "audio file.mp3", title: "Audio Recording 1", filesize: 20.megabytes, file_type: Asset.file_types[:audio], uploader: user_two, library: first_library, created_at: 3.days.ago)

  # Asset 5
  document_asset_one = Asset.create(filename: "patient A report.pdf", title: "Report of Patient A", filesize: 7.megabytes, file_type: Asset.file_types[:document], uploader: user_two, library: first_library, created_at: 2.days.ago)

  # Asset 6
  document_asset_two = Asset.create(filename: "patient B report.pdf", title: "Report of Patient B", filesize: 8.megabytes, file_type: Asset.file_types[:document], uploader: user_two, library: first_library, created_at: 1.day.ago)
  comment = document_asset_two.comments.build(comment: "Comment one", author: user_one)
  comment.save

  # Asset 7
  unkown_asset = Asset.create(filename: "presentation.ppx", title: "ChilliPharm Presentation", filesize: 5.megabytes, file_type: Asset.file_types[:unknown], uploader: user_two, library: first_library, created_at: 5.weeks.ago)

  # Asset 8
  video_asset_three = Asset.create(filename: "trial 109.mov", title: "Trial 109", filesize: 107.megabytes, file_type: Asset.file_types[:video], uploader: user_two, library: second_library, created_at: 1.weeks.ago)

  search_history = Search.create(user: user_one, search_param: 'one')
  search_history_two = Search.create(user: user_one, search_param: 'two')
  search_history_three = Search.create(user: user_one, search_param: 'three')
end
