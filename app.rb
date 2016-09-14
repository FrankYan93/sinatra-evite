require 'sinatra'
require 'sinatra/activerecord'
#require './config/environments' # database configuration
require './models/person'
require './models/event'
require './models/registration'
require 'byebug'
require 'zlib'

get '/' do
	erb :index
end

get '/persons' do
	@person_list = Person.all
	erb :person
end

get '/events' do
	@event_list = Event.all
	erb :event
end

get '/registrations' do
	@registration_list = Person.all
	erb :registration
end


get '/person/new' do
	erb :person_new
end


get '/event/new' do
	erb :event_new
end

get '/registration/new' do
	erb :registration_new
end

post '/submit' do
	@person = Person.new(params[:current_person])
	if @person.save
		redirect '/persons'
	else
		"Sorry, there was an error!"
	end
end
