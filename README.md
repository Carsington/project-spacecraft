Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

## Process cheatsheet

### 1. Se rendre à la racine du projet `project-spacecraft` sur sa machine

Deux cas de figure peuvent se présenter :

#### (Option 1) Tu es sur la branche master

En théorie, cela veut dire que tu n'as pas de feature en cours.  
Vérifier cela en tapant `git status` dans la console. **Si ce n'est pas clean, appeler Pilou**.  
Si c'est clean, tape `git branch` dans la console. Reconnais-tu une branche avec un travail en cours ? Si oui, `git checkout <nom-de-la-branche>` pour reprendre le travail en cours et passer à l'étape 2.  

Si non, tu peux taper `git sweep` pour effacer les branches inutiles/obsolètes et passer à l'étape 3.

#### (Option 2) Tu es sur ta branche de travail en cours

C'est plutôt bon signe. Quand tu as terminé ton travail sur ta branche, passe à l'étape 2.


### 2. Sauvegarder le travail de ta branche en cours

Arrivé ici, tu viens de terminer ton travail sur ta feature en cours et souhaite envoyer ça sur `master`, la branche pricinpale (le tronc) du projet.

#### 2.1. Pousser le tout sur GitHub

`git status` > si ta branche n'est pas clean, `git add <liste des fichiers à ajouter>` puis `git commit -m "message explicite des changements"`. Refais un `git status`, histoire d'être sûr.  
`git push origin <le-nom-de-ta-branche>` pour pousser tous tes changements sur ta branche distante (remote), c'est à dire GitHub.

#### 2.2. Demander à fusionner ta branche avec `master`

Rends-toi sur GitHub.com, avec un `hub browse` par exemple.  
Si tout va bien,

### 2. 