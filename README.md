[![CircleCI](https://dl.circleci.com/status-badge/img/gh/maffsojah/ml-microservice-kubernetes/tree/main.svg?style=shield)](https://dl.circleci.com/status-badge/redirect/gh/maffsojah/ml-microservice-kubernetes/tree/main)

## Operationalizing a Machine Learning Microservice API using Kubernetes

## Project Overview

This project consists of a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project operationalizes a Python flask app—in a file, `app.py`—that serves out predictions (inference) about housing prices through API calls.
The api is containerized, uploaded to DockerHub then deployed into a [kubernetes](https://kubernetes.io/) cluster. Requests against the API can be run using a provided shell script `make_predictions.sh`


### Project Files

| File/ Folder | Description |
| --- | ----------- |
| `.circleci/config.yml` | CircleCI configuration file for running lint tests on the project code |
| `model_data` | directory with datasets used to train the machine learning model |
| `out_txt_files` | directory containing the sample application docker logs(docker_out.txt) & kubernetes pod logs(kubernetes_out.txt) |
| `Dockerfile` | dthe application Dockerfile using a Python3 base image |
| `Makefile` | consists of set tasks to be run on the project like testing, linting, installing dependencies |
| `app.py` | Flask application that serves out predictions (inference) about housing prices through API calls |
| `make_predictions.sh` | shell script that sends some input data to our running model to trigger the api |
| `requirements.txt` | file used to install multiple python dependencies in the Python virtual environment |
| `resize.sh` | When testing the application using AWS Cloud9, the default EBS storage is 10GB which is smaller for running minikube + the application docker containers. `resize.sh` increases the Cloud9 instance storage to 20GB  |
| `run_docker.sh` | shell script to tag, build and run the Flask application in a Docker container |
| `run_kubernetes.sh` | shell script that creates a Kubernetes deployment using the application image from DockerHub  |
| `upload_docker.sh` | shell script that tags and uploads the application Docker image to DockerHub |


---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

* Make sure you have Docker, Hadolint and Kubernetes (Minikube) installed

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Upload Docker image to DockerHub: `./upload_docker.sh`
4. Run in Kubernetes:  `./run_kubernetes.sh`
5. Send input data to API and get prediction: `./make_prediction.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl
