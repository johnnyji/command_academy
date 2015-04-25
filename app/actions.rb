enable :sessions

# USER

get '/' do
  erb :index
end

get '/begin' do
  erb :challenges
end

get '/challenges' do
  challenges = Challenge.all.order(level: :asc)
  content_type :json
    challenges.to_json
end

get '/finished' do

end


#ADMIN

get '/signup' do
  erb :'admin/signup'
end

post '/signup' do
  @admin = Admin.new(username: params[:username], password: params[:password])
  if @admin.save
    session[:admin_id] = @admin.id
    redirect to('/admin/index')
  else
    erb :'admin/signup'
  end
end

get '/finished' do
  erb :finished
end

get '/login' do
  erb :'admin/login'
end

post '/login' do
  @admin = Admin.where(username: params[:username], password: params[:password]).first
  if @admin.nil?
    erb :'admin/login'
  else
    session[:admin_id] = @admin.id
    redirect to('/admin/index')
  end
end

get '/logout' do
  session.clear
  redirect to('/')
end

get '/admin/index' do
  @challenges = Challenge.all
  erb :'admin/index'
end

post '/admin/challenges' do
  new_level = Challenge.count + 1
  challenge = Challenge.new(instructions: params[:instructions], console_text: params[:console_text], success: params[:success], fail: params[:fail], answer: params[:answer], level: new_level)
  if challenge.save
    redirect to('/admin/index')
  else
    erb :'admin/index'
  end
end

get '/admin/challenges/:id/delete' do
  challenge = Challenge.find(params[:id])
  Challenge.update_levels(challenge.level)
  challenge.destroy
  redirect to('/admin/index')
end

get '/admin/challenges/:id/edit' do
  @challenge = Challenge.find(params[:id])
  erb :'admin/edit'
end

post '/admin/challenges/:id/edit' do
  @challenge = Challenge.update(instructions: params[:instructions], console_text: params[:console_text], success: params[:success], fail: params[:fail], answer: params[:answer])
  if @challenge.persisted?
    redirect to('/admin/index')
  else
    #flash error = sorry didnt save properly
    erb :'admin/edit'
  end
end




helpers do
  def admin_count
    @admin_count = Admin.count
  end

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  rescue ActiveRecord::RecordNotFound
    redirect to('/')
  end
end
