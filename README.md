# terraform-konnect-dp

This is a Terraform script to push Kong DP in a K8s cluster and establish connection with Konnect.


## Module Configuration Options Setup

The following fields are available for module configuration, with descriptions:

| Key     | Description | Data Type  | Default Value | Require |
| ------- | ----------- | ---------- | ------------- | ------- |
| kong-image-tag | The kong image used by the data plane | string | null | **true** |
| kong-image-repository | Image repository to pull the Kong image from. | string | "kong/kong-gateway" | false |
| kong-helm-version | The helm version | string | "2.23.0" | false |
| kong-tls-crt | The name of the signed certificate file to establish mTLS communication between DP and Konnect | string | "tls.crt" | false |
| kong-tls-key | The name of the private key file for the certificate to establish mTLS communication between DP and Konnect | string | "tls.key" | false |
| kong-cluster-cert-path | The relative path to the 2 certificates files declared above | string | null | **true** |
| kong-namespace | The namespace where the Kong DP will be deployed | string | null | **true** |
| kong-values-file |  The local data plane values files is you prefer local control | string | null | **true** |

### Kong Data Plane Value
Please use your own data plane values file for the Kong Helm Chart. You can use the file provided by the Konnect UI and the one provided as samples (and in the examples). Please make sure to fill the following field 

| Key     | Description | Data Type  | Default Value | Require |
| ------- | ----------- | ---------- | ------------- | ------- |
| cluster_control_plane | The cluster control plane endpoint as defined in Konnect "xxxxxx.eu.cp0.konghq.com:443" | string | null | **true** |
| cluster_server_name |  The cluster control server name as defined in Konnect "xxxxxx.eu.cp0.konghq.com" | string | null | **true** |
| cluster_telemetry_endpoint |  The cluster telemetry endpoint as defined in Konnect "xxxxxx.eu.tp0.konghq.com:443" | string | null | **true** |
| cluster_telemetry_server_name |  The cluster telemetry server name as defined in Konnect "xxxxxx.eu.tp0.konghq.com" | string | null | **true** |

### Provider

The default providers are using the Kube Config file and current contect. You can also use a new Kube config by declaring the Kube Endpoint and Token.

There is an example prepared for AWS, depending on your security scheme you will need to setup the following variables:
- **aws-region**: the AWS region
- **aws-access-key**: the AWS access key
- **aws-secret-key**: the AWS secret key
- **aws-token**: the AWS temporary token
- **aws-profile**: the AWS profile

You can also declare these variables directly in your CICD pipeline in the ```tf-deployment.yml``` file with ```AWS_REGION: ${{secrets.AWS_REGION}``` 

## Module Deployment

You can either use Github action from the file ```tf-deployment.yml`` or use following command line:
- **terraform init**: the terraform init command initializes a working directory containing Terraform configuration files.

- **terraform plan**: the terraform plan command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure.

- **terraform apply -auto-approve**: the terraform apply command executes the actions proposed in a Terraform plan to create, update, or destroy infrastructure.

The require variables should be declared in:
- the ```variables.tf```
- or in the kong module 
    ```
    module "kong" {variable-name = value }
    ```
- or directly in the command line with ```-var variable-name=value```