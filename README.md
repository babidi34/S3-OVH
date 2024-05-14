# OVH S3 Terraform Configuration

Ce projet Terraform est conçu pour provisionner et gérer des buckets S3 dans le cloud d'OVH. Il permet une configuration facile et sécurisée des buckets S3, utilisés pour divers besoins de stockage.

## Prérequis

Terraform v1.0.0 ou supérieur
Compte OVH avec accès à leur service S3
Configuration correcte de l'API OVH sur ta machine locale

## Installation

Pour commencer à utiliser ce projet, suis les étapes suivantes :

Clone le dépôt :

```
git clone https://gitlab.com/babidi34/s3-ovh.git
```

Navigue dans le dossier du projet :

```
cd s3-ovh
```

## Configuration

Crée un fichier terraform.tfvars pour définir tes variables spécifiques, comme les noms des buckets et les configurations régionales. Un exemple de contenu pour terraform.tfvars pourrait ressembler à ceci :

```
buckets = {
  "bucket1" = {
    name = "monbucket1"
    region = "rbx"
  },
  "bucket2" = {
    name = "monbucket2"
    region = "gra"
  }
}
```

## Utilisation

Pour initialiser Terraform et commencer le déploiement :

```
terraform init
terraform plan
terraform apply
```

Assure-toi de vérifier le plan avant d'appliquer les changements pour éviter toute configuration indésirable.
Contribution

Les contributions sont les bienvenues, qu'il s'agisse de nouvelles fonctionnalités, de corrections de bugs ou d'améliorations de la documentation. Pour contribuer :

    Fork le projet sur GitLab.
    Crée ta propre branche de fonctionnalités.
    Commit tes modifications.
    Pousse ta branche et soumets une merge request.

## Support

Pour signaler un bug ou demander une fonctionnalité, utilise le système de issues de GitLab associé à ce dépôt.

## Licence

MIT