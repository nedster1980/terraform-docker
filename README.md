To build a docker image for a specific version of Terraform execute:

docker build --build-arg DEFAULT_VALUE=<TERRAFORM_VERSION> -t <IMAGE_NAME>:<TAG> .

For example:

docker build --build-arg DEFAULT_VALUE=0.12.30 -t terraform-dockerv12.30:v1.0 .

Instantiate new container from the image:

docker run -it -d -v <DISK_LOCATION>:/tfcode --name <IMAGE_NAME>:<TAG>

docker run -it -d -v $(pwd):/tfcode --name tfapp12 terraform-dockerv12.30:v1.0

Verify Version

docker exec <NAME> terrafrom -version

docker exec tfapp12 terraform -version