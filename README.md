# GestionGlasses

## Projet

Application qui permet à un opticien de gérer son stock de lunettes.

Ce projet à été réalisé dans le cadre d'une formation à l'ENSUP. Cette formation avait pour objectif la découverte de Spring et Spring Framework.

Ce projet à pour but de déployer cette application sur AWS à l'aide de Terraform et Ansible.

Ce projet va nous permettend de déployer automatiquement notre application de gestion de lunette sur le cloud.


---
## Prérequis
* Avoir Java JDK 16
* Avoir Maven
* Télécharger le code du projet
* Se placer sur la branche qui correspond au TP
* Exécuter le main de l'application

---
## Liste des projets

Nom du projet | Description | Lien
---|---|----
GestionGlasses | Il s'agit du projet contenant notre application avec son code source, son dockerfile et un script docker-compose | [GestionGlasses](https://github.com/brikema/GestionGlasses)
GestionGlasses-role | Il s'agit du projet contenant notre rôle Ansible | [RoleAnsible](https://github.com/asemin08/GestionGlasses-role)
GestionGlasses-playground | Il s'agit du projet contenant notre playground Ansible | [PlaygroundAnsible](https://github.com/asemin08/GestionGlasses-playground)
GestionGlasses-terraform | Il s'agit du projet contenant notre script Terraform pour déployer l'application GestionGlasses | [Terraform](https://github.com/asemin08/GestionGlasses-terraform)
