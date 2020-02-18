Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

## Process cheatsheet

### 1. Rends-toi à la racine du projet `project-spacecraft` sur ta machine

Deux cas de figure peuvent se présenter :

#### (Option 1) Tu es sur la branche master

En théorie, cela veut dire que tu n'as pas de fonctionnalité en cours.  

Vérifier cela en tapant `git status` dans la console. **Si ce n'est pas clean, appeler Pilou**.  
Si c'est clean, tape `git branch` dans la console.  

Reconnais-tu une branche avec un travail en cours ?  
* Si oui, `git checkout <nom-de-la-branche>` pour reprendre le travail en cours et passer à l'étape 2.
* Si non, tu peux taper `git sweep` pour effacer les branches inutiles/obsolètes et passer à l'étape 3.

#### (Option 2) Tu es sur ta branche de travail en cours

C'est plutôt bon signe. Quand tu as terminé ton travail sur ta branche, passe à l'étape 2.

### 2. Sauvegarder le travail de ta branche en cours

Arrivé ici, tu viens de terminer ton travail sur ta fonctionnalité en cours et souhaites envoyer ça sur `master`, la branche pricinpale (le tronc) du projet.

#### 2.1. Pousser le tout sur GitHub

Lance `git status`  
Si ta branche n'est pas propre, lance `git add <liste des fichiers à ajouter>` puis `git commit -m "message explicite des changements"`. Relance un `git status`, histoire d'être sûr.  

Une fois ta branche propre, lance `git push origin <le-nom-de-ta-branche>` pour pousser tous tes changements sur ta branche distante (*remote*), c'est à dire GitHub.

#### 2.2. Demander à fusionner ta branche avec `master`

Rends-toi sur GitHub.com, avec un `hub browse` par exemple.  
Si tout va bien, tu devrais obtenir ceci:  
<img src="https://res.cloudinary.com/pil0u/image/upload/v1582018843/pullrequest_fhtzbr.png" alt="Pull Request" width="540">

Clique sur le gros bouton **Compare & pull request** puis **Create pull request**.  
Arrivé là, demande à un de tes collègues de valider et fusionner la *Pull Request* (PR), **ce n'est pas à toi de le faire**. Cela permet une validation croisée de ton code.  

Il est important de valider ta PR avant de démarrer avant de passer à l'étape suivante.

#### 2.3. Supprimer ta branche

Ton travail a correctement été fusionné avec master, bravo ! Tu peux à présent supprimer la branche précédente. Pour cela :

1. `git checkout master` pour retourner sur la branche master si ce n'était pas le cas.
2. `git sweep` pour effacer les branches inutiles/obsolètes.

### 3. Démarrer une nouvelle fonctionnalité

A cette étape, tu devrais être sur la branche master. Il ne faut **jamais** faire de changement sur cette branche directement, et donc créer une nouvelle branche pour démarrer une nouvelle fonctionnalité. Mais avant ça, tu souhaites avoir la dernière version à jour de cette fameuse branche master :  
`git pull origin master`  
Super, ta branche master est à jour et tu peux donc tirer une nouvelle branche :
`git checkout -b <le-nom-de-ta-branche>`

Et c'est reparti ! Bon code !
