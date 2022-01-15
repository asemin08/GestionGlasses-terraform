# GestionGlasses-terraform

## Projet

Application qui permet à un opticien de gérer son stock de lunettes.

Ce projet à été réalisé dans le cadre d'une formation à l'ENSUP. Cette formation avait pour objectif la découverte de Spring et Spring Framework.

Ce projet à pour but de déployer cette application sur AWS à l'aide de Terraform et Ansible.

Ce projet va nous permet de déployer automatiquement notre application de gestion de lunette sur le cloud.

---
## Prérequis pour lancer l'application

###  Prérequis création compte AWS
Si vous disposez d'un compte utilisateur d'AWS ne pas tenir compte de cette partie.
Si vous ne disposez pas d'un compte utilisateur d'AWS, ou même d'un compte administateur. Veuillez suivre la procédure ci-dessous. 

1. Créer un compte AWS (Si vous avait un compte ce rendre à l'étape 2 ).
   * Se rendre sur le formulaire d'inscription [création compte AWS](https://portal.aws.amazon.com/billing/signup#/start)
   * Suivre les différentes étapes
2. Se connecter à son compte admin [connexion compte AWS](https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3Ffromtb%3Dtrue%26hashArgs%3D%2523%26isauthcode%3Dtrue%26state%3DhashArgsFromTB_us-east-1_1364f022c298248e&client_id=arn%3Aaws%3Asignin%3A%3A%3Aconsole%2Fcanvas&forceMobileApp=0&code_challenge=Iek71FrUBznRGJisNydtG-2W9M0Nqqni3lZW_1hH0lA&code_challenge_method=SHA-256)
3. Sélection Utilisateur racine, renseigner l'adresse email et le mot de passe mis à l'étape d'avant.
4. On arrive sur la page d'accueil d'AWS
![Acceuil aws](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/AccueilAWS.png)
5. Se rendre sur la création de compte [création de compte](https://console.aws.amazon.com/iamv2/home?#/users)
6. Cliqué sur ajouter des utilisateurs
![Ajouter des utilisateurs](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/AjoutUtilisateur.png)
7. Saisir un nom d'utilisateurs
![Saisie nom utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/SaisieUtilisateur.png)
8. Cocher les casses ci-dessous est saisir un mot de passe pour le compte
![mots de passe utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/MDPUtilisateur.png)
9. Cliqué sur suivant
10. Sélectionner "Attacher directement les stratégies existantes"
11. Sélectionner "AdministratorAccess"
![droit utilisateur utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/DroitUtilisateur.png)
12. Cliqué sur suivant 
13. Nous n'allons pas définir de balise 
14. Cliqué sur suivant
15. Vous arrivez sur l'écran de vérification de votre utilisateur.
![Ecran verif utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/VerifUtilisateur.png)
16. Cliquer sur créer l'utilisateur.
17. On arrive sur un écran récapitulatif.
18. Télécharger le fichier svg nous en aurons besoin plus tard.
![Ecran SVG utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/EcranSVG.png)
19. Cliqué sur fermer.
20. Nous voyons que l'utilisateur à bien été créer
![Ecran verif utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/UtilisateurCreer.png)
21. Ensuite nous pouvons nous déconnecter.
![Deconexion utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/UtilisateurCreer.png)
---
###  Prérequis pour utiliser notre compte AWS
1. Ouvrir le fichier svg récupéré à l'étape 18 du "prérequis créations d'un compte AWS".
2. Cliqué sur la cellule A2 
3. Récupérer l'adresse de votre interface aws
![url interface](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/interfaceAWS.png)
4. Ouvrir un navigateur avec l'url.

---
## Liste des projets

Nom du projet | Description | Lien
---|---|----
GestionGlasses | Il s'agit du projet contenant notre application avec son code source, son dockerfile et un script docker-compose | [GestionGlasses](https://github.com/brikema/GestionGlasses)
GestionGlasses-role | Il s'agit du projet contenant notre rôle Ansible | [RoleAnsible](https://github.com/asemin08/GestionGlasses-role)
GestionGlasses-playground | Il s'agit du projet contenant notre playground Ansible | [PlaygroundAnsible](https://github.com/asemin08/GestionGlasses-playground)
GestionGlasses-terraform | Il s'agit du projet contenant notre script Terraform pour déployer l'application GestionGlasses | [Terraform](https://github.com/asemin08/GestionGlasses-terraform)
