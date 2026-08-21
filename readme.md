# Gestionnaire de Tâches (Todo App)

Une application web minimaliste et rapide de gestion de tâches. Ce projet combine un backend léger utilisant le framework Ruby Sinatra pour l'exécution locale et une interface utilisateur construite en JavaScript pur (Vanilla JS), configurée pour un déploiement autonome.

## Fonctionnalités Principales

* **Gestion du cycle de vie des tâches :** Ajout instantané de nouvelles tâches, marquage des tâches terminées par un système de bascule, et suppression définitive.
* **Double mode d'exécution :** 
  * *Mode Local :* Un serveur Ruby Sinatra distribue les fichiers et expose une API de démonstration.
  * *Mode Statique (Production) :* L'interface bascule sur le stockage du navigateur pour garantir une exécution 100% autonome.
* **Persistance des données :** Sauvegarde automatique de l'état des tâches dans le stockage local (localStorage) du navigateur afin de ne pas perdre les données lors de la fermeture de la page.
* **Automatisation du build et du déploiement :** Intégration d'un système de scripts Ruby (Rakefile) pour compiler les ressources et publier l'application en une seule commande.

## Technologies Utilisées

* **Backend :** Ruby, Sinatra, Puma, Rackup
* **Frontend :** HTML5, CSS3, JavaScript (Vanilla ES6)
* **Automatisation et Outils :** Rake, Git

## Architecture du Projet

```text
todo-ruby-version/
├─ public/           # Dossier contenant les ressources du frontend
│  ├─ index.html     # Structure de la page et logique JavaScript
│  └─ style.css      # Mise en page et design de l'interface
├─ app.rb            # Serveur web local Sinatra
├─ Rakefile          # Scripts d'automatisation (Build et Déploiement)
├─ Gemfile           # Liste des dépendances Ruby
└─ Gemfile.lock      # Versions figées des dépendances
```

## Installation et Utilisation Locale

### Prérequis
* Ruby (version 3.0 ou supérieure) avec le DevKit installé sur votre système.

### Procédure

1. Clonez le dépôt sur votre machine :
   ```bash
   git clone https://github.com
   cd todo-ruby-version-
   ```

2. Installez les dépendances Ruby requises :
   ```bash
   bundle install
   ```

3. Lancez le serveur Sinatra local :
   ```bash
   ruby app.rb
   ```

4. Ouvrez votre navigateur et accédez à l'adresse suivante :
   ```text
   http://localhost:4567
   ```

## Build et déploiement sur GitHub Pages

Le projet intègre un outil d'automatisation appelé Rake pour gérer les publications. Pour compiler le projet et envoyer la version de production directement sur la branche `gh-pages` de votre dépôt GitHub, exécutez la commande suivante dans votre terminal :

```bash
bundle exec rake build
bundle exec rake deploy
```
