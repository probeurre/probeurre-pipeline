The pipeline manages all the other components.

To clone them all and build the Docker images, run :

```
git clone https://gitlab.forge.hefr.ch/probeurre/probeurre-pipeline.git
git clone https://gitlab.forge.hefr.ch/probeurre/probeurre-cloner.git
git clone https://gitlab.forge.hefr.ch/probeurre/probeurre-analyzer.git
git clone https://gitlab.forge.hefr.ch/probeurre/probeurre-extracter.git
git clone https://gitlab.forge.hefr.ch/probeurre/probeurre-visualizer.git
cd probeurre-pipeline
sudo docker build -t probeurre:pipeline .
cd ../probeurre-cloner
sudo docker build -t probeurre:cloner .
cd ../probeurre-analyzer
sudo docker build -t probeurre:analyzer .
cd ../probeurre-extracter
sudo docker build -t probeurre:extracter .
cd ../probeurre-visualizer
sudo docker build -t probeurre:visualizer .
cd ..
echo "Done. Running the pipeline"
```

To run the pipeline on the repository with URL `<repo>` at the date `date`, run :
```
sudo docker run -it -v /run/docker.sock:/run/docker.sock --rm probeurre:pipeline pipeline.sh -r <repo> [-d date]
```

For example, for facebook/React :
```
sudo docker run -it -v /run/docker.sock:/run/docker.sock --rm probeurre:pipeline pipeline.sh -r https://github.com/facebook/react.git
```