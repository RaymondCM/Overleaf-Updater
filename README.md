# Overleaf-Updater
A simple bash script to pull changes from Overleaf and push to your GitHub repository.

## Installation
Clone your [Overleaf](https://www.overleaf.com) project locally, replacing XXXXXXXXX with your project ID. Move the update-git file into the root of your repository or just run the curl command in the root of it.

```bash
git clone https://git.overleaf.com/XXXXXXXXX
cd XXXXXXXXX
curl -o update-git.sh https://raw.githubusercontent.com/RaymondKirk/Overleaf-Updater/master/update-git.sh
```

Add a new remote called github, you may need to create an empty repository if you don't have one already. Once created replace the url in the add remote command and push to it.

```bash
git remote add github https://github.com/YourUserName/YourRepositoryGoesHere.git
git push github master
```

Run your bash script and let changes on overleaf will be pushed to git!

```bash
 ./update-git.sh
 
 #or to run in the background 
 
 ./update-git.sh &
```
