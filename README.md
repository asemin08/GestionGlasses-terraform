# GestionGlasses-terraform

## Projet

Application qui permet à un opticien de gérer son stock de lunettes.

Ce projet à été réalisé dans le cadre d'une formation à l'ENSUP. Cette formation avait pour objectif la découverte de Spring et Spring Framework.

Ce projet à pour but de déployer cette application sur AWS à l'aide de Terraform et Ansible.

Ce projet va nous permet de déployer automatiquement notre application de gestion de lunette sur le cloud.

---
## Prérequis pour lancer l'application

Sommaire
 1. [Création d'un compte AWS](#compteAws)
 2. [Utilisation compte AWS](#utiliseAws)
 3. [Installation de Terraform](#Terraform)
 4. [Déploiement de l'application](#application)
---
<div id='compteAws'/>  

###  Prérequis création compte AWS
---

Si vous disposez d'un compte utilisateur d'AWS ne pas tenir compte de cette partie.
Si vous ne disposez pas d'un compte utilisateur d'AWS, ou même d'un compte administateur. Veuillez suivre la procédure ci-dessous. 

1. Créer un compte AWS (Si vous avez un compte, se rendre à l'étape 2 ).
   * Se rendre sur le formulaire d'inscription [création compte AWS](https://portal.aws.amazon.com/billing/signup#/start)
   * Suivre les différentes étapes
2. Se connecter à son compte admin [connexion compte AWS](https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3Ffromtb%3Dtrue%26hashArgs%3D%2523%26isauthcode%3Dtrue%26state%3DhashArgsFromTB_us-east-1_1364f022c298248e&client_id=arn%3Aaws%3Asignin%3A%3A%3Aconsole%2Fcanvas&forceMobileApp=0&code_challenge=Iek71FrUBznRGJisNydtG-2W9M0Nqqni3lZW_1hH0lA&code_challenge_method=SHA-256)
3. Sélection Utilisateur racine, renseigner l'adresse email et le mot de passe mis à l'étape d'avant.
4. On arrive sur la page d'accueil d'AWS
![Acceuil aws](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/AccueilAWS.png)
5. Se rendre sur la création de compte [création de compte](https://console.aws.amazon.com/iamv2/home?#/users)
6. Cliquer sur ajouter des utilisateurs
![Ajouter des utilisateurs](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/AjoutUtilisateur.png)
7. Saisir un nom d'utilisateur
![Saisie nom utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/SaisieUtilisateur.png)
8. Cocher les casses ci-dessous est saisir un mot de passe pour le compte
![mots de passe utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/MDPUtilisateur.png)
9. Cliquer sur suivant
10. Sélectionner "Attacher directement les stratégies existantes"
11. Sélectionner "AdministratorAccess"
![droit utilisateur utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/DroitUtilisateur.png)
12. Cliquer sur suivant 
13. Nous n'allons pas définir de balise 
14. Cliquer sur suivant
15. Vous arrivez sur l'écran de vérification de votre utilisateur.
![Ecran verif utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/VerifUtilisateur.png)
16. Cliquer sur créer l'utilisateur.
17. On arrive sur un écran récapitulatif.
18. Télécharger le fichier svg nous en aurons besoin plus tard.
![Ecran SVG utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/EcranSVG.png)
19. Cliquer sur fermer.
20. Nous voyons que l'utilisateur à bien été créer
![Ecran verif utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/UtilisateurCreer.png)
21. Ensuite nous pouvons nous déconnecter.
![Deconexion utilisateur](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/Deconnexion.png)
---
<div id='utiliseAws'/>  

###  Prérequis pour utiliser notre compte AWS
--- 
1. Ouvrir le fichier svg récupéré à l'étape 18 du "prérequis créations d'un compte AWS".
2. Cliquer sur la cellule A2 
3. Récupérer l'adresse de votre interface AWS
![url interface](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/interfaceAWS.png)
4. Ouvrir un navigateur avec l'url.
5. Saisir le login et le mot de passe 
![url interface](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/interfaceAWS.png)
6. Rechercher paires de clés ou se rendre sur [paire de clé](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#KeyPairs:)
![key recherche](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/KeyRecherche.png)
7. On doit arriver sur cette interface.
![key recherche](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/interfaceKey.png)
8. Cliquer sur "Créer une paire de clés"
9. Sélectionner le "type de paire de clé" en RSA
10. Sélectionner le "Format de fichier de clé privé" en .pem
![key creation](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/CrerKey.png)
11. Cliquer sur "Créer une paire de clés"
12. Un fichier avec l'extension .pem est téléchargé automatiquement. Il faut mettre de côté ce fichier il nous servira plus tard.
![key veriff](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/VerifKey.png)

Nous en avons fini avec la configuration de AWS. Donc nous allons passer à l'installation de Terraform.

---
<div id='Terraform'/>  

###  Prérequis pour installer Terraform
---

1. Se rendre sur ce lien [télécharger Terraform](https://www.terraform.io/downloads)
2. Choisir la version selon son système d'exploitation.
Nous allons continuer l'installation pour windows.
3. Cliquer sur Amd64 pour télécharger le zip.
![download terraform](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/DownloadTerraform.png)
4. Décompresser le zip de Terraform.
5. Effectuer une recherche en appuyant sur la touche windows et rechercher "modifier les variables d’environnement système".
6. Cliquer sur "Variables d'environnement".
![PropriterSysteme terraform](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/PropriterSysteme.png)
7. Faire un double clique sur la variable d'utilisateur path.
![VariablePath terraform](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/VariablePath.png)
8. Cliquer sur parcourir.
![CliqueParcourir terraform](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/CliqueParcourir.png)
9. Sélectionner le dossier décompressé de Terraform.
![SelectTerraform terraform](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/SelectTerraform.png)
10. Cliquer sur ok sur tous les pop-up ouverts.
Teste pour voir si Terraform est bien installé et configuré.
11. Sur votre clavier faite la combinaison windows + r .
12. Puis recherche cmd cela va ouvrir une invite de commande.
![W+R terraform](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/W+R.png)
13. Dans cette invite lancer la commande : ```terraform -v```
![Version terraform](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/TerraVersion.png)

Si vous avez le même résultat vous avaient fini l'installation et la configuration de Terraform sur votre poste de travail.

--- 
<div id='application'/> 
 
###  Prérequis pour déployer l'application de Gestion de lunette.
---

1. Avoir ou installer [git](https://git-scm.com/downloads).
2. Récupérer le code source de l'application.
```git clone https://github.com/asemin08/GestionGlasses-terraform.git```
3. Dans le projet récupéré créer un dossier .aws
4. Créer un fichier credentials
5. Copier ce code dans le fichier. Remplacé par les valeurs que vous avez dans votre fichier SVG voire "Prérequis pour utiliser notre compte AWS" étape 3.
```sh
[default]
aws_access_key_id = "Acces key id"
aws_secret_access_key = "Secret access key"
```
6. Copier le fichier de votre clé (voir " Prérequis pour utiliser notre compte AWS" étape 12 ) dans le dossier .aws/
![AWS DIRECTORY](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/AwsDirectory.png)
7. Ouvrir le fichier variable ce trouvant dans le dossier module et ec2
8. Cherche la variables cle_ssh est remplacé la valeur par le nom du fichier de votre clé dans notre cas DemoGithub.
![AWS VARS](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/VariableModif.png)
9. Ensuite il faut ouvrir une invite de commande dans le dossier.
10. Il faut ce placé dans le dossier app avec la commande : ```cd app```
11. Ensuite nous faisons la commande :  ```terraform init ``` pour initialiser notre projet comme projet Terraform.
12. Ensuite la commande : ```terraform plan``` pour voir préparer les actions de Terraform.
13. Ensuite la commande : ```terraform apply``` pour lancer le script Terraform.
A ce moment saisir "yes" pour continuer ou "no" pour quitter le déploiement de l'application à l'aide de terraform.
![AWS YeSorNo](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/YesOrNot.png)
14. Lorsque le Terraform apply est fini (environ 5 minutes) il faut se rendre dans le dossier app et ouvrir le fichier ip_connection.
![AWS TERRAFORM finit](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/Deployfin.png)
15. Aller à la dernière ligne du fichier.
16. Copier l'url
![AWS URL](https://github.com/asemin08/GestionGlasses-terraform/blob/main/imgs_reamde/url_dispo.png)
17. Ouvrir un navigateur 
18. Coller l'url et vous accédez à notre application.
---
## Liste des projets

Nom du projet | Description | Lien
---|---|----
GestionGlasses | Projet contenant notre application avec son code source, son dockerfile et un script docker-compose | [GestionGlasses](https://github.com/brikema/GestionGlasses)
GestionGlasses-role | Projet contenant notre rôle Ansible | [RoleAnsible](https://github.com/asemin08/GestionGlasses-role)
GestionGlasses-playground | Projet contenant notre playground Ansible | [PlaygroundAnsible](https://github.com/asemin08/GestionGlasses-playground)
GestionGlasses-terraform | Projet contenant notre script Terraform pour déployer l'application GestionGlasses | [Terraform](https://github.com/asemin08/GestionGlasses-terraform)
