# Airbyte

The IaC scripts for deploying Airbyte to GCE reside in this repository. 

## Get Started

You will need to install Google Cloud SDK if you don't already have it:

```bash
gcloud auth application-default login
```

To access the VM, generate an SSH key:
```bash
ssh-keygen -t rsa -f ~/.ssh/airbyte -C xxx@dixa.com
```


Establish the SSH tunel by running 
```bash
gcloud --project=bi-dixa-staging beta compute ssh USERNAME@airbyte -- -L 8000:localhost:8000 -N -f
```

Just visit http://localhost:8000 in your browser and start moving some data!

## Using Terraform
To recreate the instance, run the following resources:

```bash
terraform apply
```

If you wish to clean up the existing infrastructure, run:
```bash
terraform destroy
```