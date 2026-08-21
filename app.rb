# app.rb
require 'sinatra'
require 'json'

# Configuration pour activer le dossier public (fichiers statiques)
set :public_folder, __dir__ + '/public'

# Notre base de données temporaire en mémoire
TODOS = [
  { id: 1, title: 'Installer Ruby et DevKit', completed: true },
  { id: 2, title: 'Créer le fichier app.rb', completed: true },
  { id: 3, title: 'Coder l interface React sans Vite', completed: false }
]

# ---- ROUTE FRONTEND ----

# Sert notre page HTML principale
get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

# ---- ROUTES API ----

# 1. LIRE
get '/api/todos' do
  content_type :json
  TODOS.to_json
end

# 2. CRÉER
post '/api/todos' do
  content_type :json
  payload = JSON.parse(request.body.read)
  
  new_todo = {
    id: Time.now.to_i,
    title: payload['title'],
    completed: false
  }
  
  TODOS << new_todo
  new_todo.to_json
end

# 3. MODIFIER (Statut terminé / en cours)
put '/api/todos/:id' do
  content_type :json
  id = params[:id].to_i
  todo = TODOS.find { |t| t[:id] == id }
  
  if todo
    payload = JSON.parse(request.body.read)
    todo[:completed] = payload['completed']
    todo.to_json
  else
    status 404
    { error: "Todo non trouvé" }.to_json
  end
end

# 4. SUPPRIMER
delete '/api/todos/:id' do
  content_type :json
  id = params[:id].to_i
  todo = TODOS.find { |t| t[:id] == id }
  
  if todo
    TODOS.delete(todo)
    { success: true }.to_json
  else
    status 404
    { error: "Todo non trouvé" }.to_json
  end
end
