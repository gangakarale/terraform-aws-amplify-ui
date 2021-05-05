## Usage

To run this example you need to execute:
```bash
$ terraform init
$ terraform plan -out=basic.tfplan
$ terraform apply -auto-approve basic.tfplan
```
To delete all the resources you need to execute:
```bash
$ terraform destroy -auto-approve
```