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
	@registration_list = Registration.all
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

post '/submit_p' do
	@person = Person.new(params[:current_person])
	if @person.save
		redirect '/persons'
	else
		"Sorry, there was an error!"
	end
end

post '/submit_e' do
	@event = Event.new(params[:current_event])
	if @event.save
		redirect '/events'
	else
		"Sorry, there was an error!"
	end
end

post '/submit_r' do
	@registration = Registration.new(params[:current_registration])
	if @registration.save
		redirect '/registrations'
	else
		"Sorry, there was an error!"
	end
end
