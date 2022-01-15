# GestionGlasses-terraform

## Projet

Application qui permet à un opticien de gérer son stock de lunettes.

Ce projet à été réalisé dans le cadre d'une formation à l'ENSUP. Cette formation avait pour objectif la découverte de Spring et Spring Framework.

Ce projet à pour but de déployer cette application sur AWS à l'aide de Terraform et Ansible.

Ce projet va nous permet de déployer automatiquement notre application de gestion de lunette sur le cloud.

---
## Prérequis pour lancer l'application

###  Prérequis pour AWS

1. Créer un compte AWS (Si vous avais un compte ce rendre à l'étape 2 ).
   * Ce rendre sur le formulaire d'inscription [création compte AWS](https://portal.aws.amazon.com/billing/signup#/start)
   * Suivre les différentes étapes
2. Se connecter à sont compte admin [connexion compte AWS](https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3Ffromtb%3Dtrue%26hashArgs%3D%2523%26isauthcode%3Dtrue%26state%3DhashArgsFromTB_us-east-1_1364f022c298248e&client_id=arn%3Aaws%3Asignin%3A%3A%3Aconsole%2Fcanvas&forceMobileApp=0&code_challenge=Iek71FrUBznRGJisNydtG-2W9M0Nqqni3lZW_1hH0lA&code_challenge_method=SHA-256)
3. Sélection Utilisateur racine, renseigner l'adresse email et le mot de passe mis à l'étape d'avant.
4. On arrive sur la page d'acceuil d'AWS

---
## Liste des projets

Nom du projet | Description | Lien
---|---|----
GestionGlasses | Il s'agit du projet contenant notre application avec son code source, son dockerfile et un script docker-compose | [GestionGlasses](https://github.com/brikema/GestionGlasses)
GestionGlasses-role | Il s'agit du projet contenant notre rôle Ansible | [RoleAnsible](https://github.com/asemin08/GestionGlasses-role)
GestionGlasses-playground | Il s'agit du projet contenant notre playground Ansible | [PlaygroundAnsible](https://github.com/asemin08/GestionGlasses-playground)
GestionGlasses-terraform | Il s'agit du projet contenant notre script Terraform pour déployer l'application GestionGlasses | [Terraform](https://github.com/asemin08/GestionGlasses-terraform)
