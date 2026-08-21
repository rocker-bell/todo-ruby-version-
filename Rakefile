# Rakefile
require 'fileutils'

DIST_DIR = 'dist'
PUBLIC_DIR = 'public'

desc 'Build the frontend assets for deployment'
task :build do
  puts "🏗️  Début du Build..."
  
  # 1. Nettoyer l'ancien dossier de build s'il existe
  FileUtils.rm_rf(DIST_DIR)
  FileUtils.mkdir_p(DIST_DIR)
  
  # 2. Copier les fichiers du dossier public vers le dossier de distribution (dist)
  if Dir.exist?(PUBLIC_DIR)
    FileUtils.cp_r(Dir.glob("#{PUBLIC_DIR}/*"), DIST_DIR)
    puts "✅ Fichiers copiés avec succès dans le dossier /#{DIST_DIR} !"
  else
    puts "❌ Erreur : Le dossier /#{PUBLIC_DIR} n'existe pas."
    exit 1
  end
  
  puts "🎉 Build terminé !"
end

desc 'Deploy the dist directory to GitHub Pages'
task :deploy => :build do
  puts "🚀 Préparation du déploiement sur GitHub Pages..."
  
  unless Dir.exist?(DIST_DIR)
    puts "❌ Erreur : Veuillez d'abord générer le build."
    exit 1
  end
  
  Dir.chdir(DIST_DIR) do
    system("git init")
    system("git checkout -b main") # Force la création de la branche main localement
    system("git add .")
    
    # Utilisation de guillemets doubles échappés pour Windows
    system("git commit -m \"Deploy to GitHub Pages via Rake\"")
    
    remote_url = `git -C .. remote get-url origin`.strip
    
    if remote_url.empty?
      puts "❌ Erreur : Aucun dépôt distant 'origin' détecté."
      exit 1
    end
    
    puts "📤 Envoi des fichiers vers la branche gh-pages de #{remote_url}..."
    # On pousse la branche locale 'main' vers la branche distante 'gh-pages'
    system("git push -f #{remote_url} main:gh-pages")
  end
  
  FileUtils.rm_rf(DIST_DIR)
  puts "✨ Processus terminé !"
end
