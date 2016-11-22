== Deploiement de module ==
=== Construction des AMP ===
dans le repertoire (pour chaque repertoire) faire : mvn package
Cela va créer un fichier  AMP par module
=== Deploiement des extensions sur l'instance alfresco ===
En fonction du type (repo -> plateform, ou share (UI), positionner les archives AMP dans le dossier AMP ou AMP_share
(l'emplacement varie en fonction de votre installation)
=== Installer les extensions ===
arreter alfresco : ./alfresco.sh stop
dans le dossier bin utiliser l'outil module-management-tool pour installer le module dans le war
java -jar module-management-tool.jar ../amp/monamp.amp ../tomcat/webapps/alfresco.war 
 == Vérifier la liste des modules installé ===
java -jar module-management-tool.jar list ../tomcat/webapps/alfresco.war
Redemarrer alfresco : ./alfresco.sh start 
