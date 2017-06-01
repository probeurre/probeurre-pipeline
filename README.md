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
echo "Done."
```