SITE_NAME=swsdp 
#Creation d'un dossier
curl -uadmin:admin -X POST -d '{ "name" : "Test folder" }' -H "content-type: APPLICATION/JSON" http://localhost:8080/alfresco/s/api/site/folder/${SITE_NAME}/documentlibrary
#Ajout d'un fichier
curl -uadmin:admin -X POST --form "filedata=@support_alfresco_developpement.pdf" -F destination="workspace://SpacesStore/38745585-816a-403f-8005-0a55c0aec813" http://localhost:8080/alfresco/s/api/upload
#modification des métadonnées
curl -X POST -v -uadmin:admin http://localhost:8080/alfresco/s/api/metadata/node/workspace/SpacesStore/04b302e6-1080-44d5-aefa-05a93ba794c4 -H "content-type:application/json" -d "{\"properties\":{\"cm:title\":\"Nouveau titre\",\"cm:description\":\"Nouvelle description\"}}"
#Définition des permissions pour un user
curl -X POST -v -uadmin:admin http://localhost:8080/alfresco/s/slingshot/doclib/permissions/workspace/SpacesStore/04b302e6-1080-44d5-aefa-05a93ba794c4 -H "content-type:application/json" -d "{\"permissions\":[{\"authority\":\"abeecher\",\"role\":\"Coordinator\"},],\"isInherited\":false}"
#Ajout permission pour un groupe
curl -X POST -v -uadmin:admin http://localhost:8080/alfresco/s/slingshot/doclib/permissions/workspace/SpacesStore/ccadfe-ad81-4795-95f1-0f8ef66da6af -H "content-type:application/json" -d "{\"permissions\":[{\"authority\":\"GROUP_toto\",\"role\":\"Collaborator\"},],\"isInherited\":false}"
#Recherche d'un document sur le mot "nouveau"
curl -uadmin:admin http://localhost:8080/alfresco/s/slingshot/search?term=nouveau
#MAJ d'un document
curl -uadmin:admin -X POST --form "filedata=@support_alfresco_developpement.pdf" -F updatenoderef="workspace://SpacesStore/04b302e6-1080-44d5-aefa-05a93ba794c4" http://localhost:8080/alfresco/s/api/upload -F "majorversion=true"
#Récupérer l'historique d'un document
curl http://localhost:8080/alfresco/s/api/version?nodeRef=workspace:\/\/SpacesStore\/04b302e6-1080-44d5-aefa-05a93ba794c4 -uadmin:admin