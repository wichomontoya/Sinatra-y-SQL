require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "./heroe.rb"
require "pg"

# Configuracion del adaptador a la base de datos
configure do
	set :conn, PG.connect(dbname: 'heroesruby')
end

before do
	@conn=settings.conn
end

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

get "/" do
	@heroes=[]
	@conn.exec("SELECT * FROM heroes") do |resultados|
		resultados.each do |heroe|
			# las llaves del hash son tal cuales estan en las columnas de las tablas de sql
			@heroes.push(Heroe.new(heroe['nombre'],heroe['nivel_de_poder'],heroe['id']))
		end
	end
	erb :index
end

get '/heroes/new' do
	erb :new
end

get '/heroes/:heroe_id' do
	resultados=@conn.exec("SELECT * FROM heroes WHERE heroes.id=$1",[params[:heroe_id]])
	@heroe=Heroe.new(resultados[0]['nombre'],resultados[0]['nivel_de_poder'],resultados[0]['id'])
	erb :show
end

post '/heroes/crear' do
	@conn.exec("INSERT INTO heroes(nombre,nivel_de_poder) VALUES ($1,$2)",[params[:nombre],params[:nivelDePoder]])
	redirect to('/')
end

