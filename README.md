# Iac
> If you’re using this demo, please :star: this repository to show your interest!

Iac Integration Tests with Inspec
## Getting Started
### Prerequistes
Install Inspec
```
apt-get -y install ruby ruby-dev gcc g++ make
gem install inspec-bin
```
### Create Inspec Profile
```
inspec init profile tests/profiles/aws
```
### Create Instance
```
cd terraform/environments/dev
terraform init
terraform plan
terraform apply --auto-approve
mkdir -p ~/iac-integration-tests/tests/profiles/aws/files
terraform output --json > ~/iac-integration-tests/tests/profiles/aws/files/tfoutput.json
```
### Run Integration Tests
```
cd ~/iac-integration-tests
inspec exec test/profiles/aws -t aws://us-east-2/default
```
