require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_clients
    make_locations
    make_jobs
  end
end

def make_users
  # Need to still add in users and grant access
end

def make_clients
    25.times do |n|
      name = Faker::Name.name
      phone = Faker::PhoneNumber.phone_number
      Client.create!(:name => name, :phone_number => phone)
    end
end

def make_locations    
    25.times do |n|
      name = Faker::Name.name
      street = Faker::Address.street_address
      city = Faker::Address.city
      zip = Faker::Address.zip_code
      phone = Faker::PhoneNumber.phone_number
      Location.create!(:addr1 => street,
        :city => city, :zip => zip, :name => name,
        :phone_number => phone )
    end
end

def make_jobs    
    25.times do |n|
      @status = ['open', 'followup', 'in_progress', 'closed', 'archived']
      cats = 1 + rand(50)
      acats = 1 + rand(cats)
      locations = Location.all
      location = locations[1..25]
      job = Job.create!(:number_of_cats => cats, :location => location.rand, :status => @status.rand.to_s )
      if job.status == 'closed' || job.status == 'archived'
        job.update_attributes(:actual_number_of_cats => acats)
      end
       
    end
end
