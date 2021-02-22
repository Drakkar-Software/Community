desc 'This task is called to reset the database with test data'
task reseed_test_database: :environment do
  puts 'Cleaning Up The DB...'
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
  puts 'Seeding the DB again...'
  Rake::Task['db:seed'].invoke
  Rake::Task['spree_sample:load'].invoke
  puts 'Database reset done'
end
