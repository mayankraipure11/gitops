
# About
This repo contains the Devops Infra Code challenge

## Dear applicant
Please see and follow instructions in [challenge.md](./challenge.md)

## Dear code challenge operator
To create the Code Challenge, follow the instruction in [README.md](https://github.com/signavio/hiring-tools/blob/master/README.md).
To evaluate the code challenge, you can use [this tool](https://github.com/signavio/grizzlies/blob/master/tools/evaluate_code_challenge/README.md).



This assignment creates two application as mentioned in [Challange]('https://github.com/signavio-hiring/coding-challenge-mayank/blob/main/challenge.md') 


## Prerequisites

- Kind
- kubectl
- Docker
- Bash shell

| App Name      | Tech Stack | Port  |
|---------------|------------|-------|
| app-message-1 | fastApi    | 8081  |


Run application locally
from your home directory 
cd ./app-message-1
fastapi run --port 8081

## API Calls

- **Base URL**: `http://0.0.0.0:8081/`
    - Response: `{"detail":"Not Found"}`

- **Ping Endpoint**: `http://0.0.0.0:8081/ping`
    - Response: `{"id":1,"message":"Welcome! to app-message-1"}`

- **Message Endpoint**: `http://0.0.0.0:8081/message`
    - Response: `{"id":1,"message":"Hello from app-message-1"}`

- **Message with Query**: `http://0.0.0.0:8081/message?msg=hello%20india`
    - Response: `{"id":1,"message":"hello india"}`




| App Name      | Tech Stack | Port  |
|---------------|------------|-------|
| app-message-2 | fastApi    | 8080  |


## API Calls

- **Base URL**: `http://0.0.0.0:8080/`
    - Response: `{"detail":"Not Found"}`

- **Ping Endpoint**: `http://0.0.0.0:8080/ping`
    - Response: `{"id":1,"message":"Welcome! to app-message-2"}`

- **Message Endpoint**: `http://0.0.0.0:8080/message`
    - Response: `{"id":1,"message":"Hello from app-message-2"}`

- **Message with Query**: `http://0.0.0.0:8080/message?msg=hello%20india`
    - Response: `{"id":1,"message":"aidni olleh"}`



## Infra

Scripts for creating a Kind cluster are available in the `./infra` directory and can be utilized to provision the cluster using `kind-config.yaml`.

Run

```
./infra/infra-create.sh
```

An alternative cluster provisioning method using Terraform is currently under development.

# Image building

To build an independent image for each application and push it to the repository, you can use the following commands:

```
./ci/app-one.sh
```

```
./ci/app-two.sh
```

# Deployment

To build, deploy, and access the application, execute the following command:

```
./script.sh
```

You can access the application at: `http://0.0.0.0:8080/`


This command will:
- Build the image and push it to the Docker Hub repository.
- Deploy the manifest to the existing Kind cluster.
- Port-forward to the second application, app-message-2, so that it is accessible in the browser.

If you wish to create the infrastructure with `script.sh`, kindly use:

```
./script-with-infra.sh
```
This will also provision a Kind cluster with a single node (control-plane).

# Access the application

Once you have executed the .script.sh file you can access the application via the api

- **Base URL**: `http://0.0.0.0:8080/`
    - Response: `{"detail":"Not Found"}`

- **Ping Endpoint**: `http://0.0.0.0:8080/ping`
    - Response: `{"id":1,"message":"Welcome! to app-message-2"}`

- **Message Endpoint**: `http://0.0.0.0:8080/message`
    - Response: `{"id":1,"message":"Hello from app-message-2"}`

- **Message with Query**: `http://0.0.0.0:8080/message?msg=hello%20india`
    - Response: `{"id":1,"message":"aidni olleh"}`

To pass a custom message, use the following URL format:

```
http://0.0.0.0:8080/message?msg=YOUR_MESSAGE_HERE
```

Replace `YOUR_MESSAGE_HERE` with the desired string.


# Further Improvements 

- **Readiness Check**: Although readiness and liveness APIs have been created, there are issues implementing them within Kubernetes as the API is not reachable. Status: In Progress.

- **Helm Deployment**: The Helm chart creation and configuration are complete. Currently, there is an issue with the app-message-two Helm chart that I am fixing. Status: In Progress.

- **GitOps for Deployment (Flux)**: Dploy the application via Flux GitOps practices in kind cluster.

- **Ingress Resources**: Services are currently exposed via port forwarding; this can be achieved using ingress resources.

- **Terraform**: Cluster creation is currently done using the `kind create` command. I am working on creating the cluster using Terraform.

# Additional

If you wish to build and run the application without Kubernetes, you can use the provided `docker-compose.yaml` script to run and build the application locally without a Kubernetes cluster.

Run
```
docker compose up --build
```
