# gbfs-challenge

## Description

This project ingests GBFS payload given from system.csv file and extract operators data thanks to theirs gbfs API. And then, it create a json file with API response content in order to upload it in the AWS S3 bucket.

Json files upload in S3 bucket look like : "operator name"-organization.json .

The script can be launch manually on local machine and automatically.

## Pre-requisites
- Python
- terraform
- AWS account

## How to use the Script
Ensure you have secret credentials configured : 
To do that, `install awscli` and launch `aws configure`.

- On Local.
    - `cd terraform-files`
    - `python ../main.py`

- Using terraform
    - `cd terraform-files`
    - `terraform init`
    - `terraform plan -out="app.gbfs"`
    - `terraform apply "app.gbfs"`

## Tree
- `main.py` : contain the backend script in python.
- `terraform-files/main.tf`: contain the resources 