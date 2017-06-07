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

To run the pipeline on the repository with URL `<repo>` at the date `date`, run :
```
sudo docker run -it -v /run/docker.sock:/run/docker.sock --rm probeurre:pipeline pipeline.sh -r <repo> [-d date]
```

For example, for facebook/React :
```
sudo docker run -it -v /run/docker.sock:/run/docker.sock --rm probeurre:pipeline pipeline.sh -r https://github.com/facebook/react.git
```

Once finished, you'll be able to access the results on (http://localhost:5555)[http://localhost:5555].

## Report

The paper is available in [doc/report.pdf](doc/report.pdf).

## Slides

The slides of the presentation are available in [doc/slides.pdf](doc/slides.pdf).