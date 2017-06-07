# probeurre-pipeline

**probeurre-pipeline** is the main component of the probeurre application. It manages and runs all the four other components. :

- probeurre-cloner
- probeurre-extracter
- probeurre-analyzer
- probeurre-visualizer

## Run

To clone all of the repos and build the Docker images, run :

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

## Report

The paper is available in [doc/report.pdf](doc/report.pdf).

## Slides

The slides of the presentation are available in [doc/slides.pdf](doc/slides.pdf).
