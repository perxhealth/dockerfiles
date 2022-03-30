**Steps to build and push a new image**

____

1. Ensure you are logged in with a role that has access to the AWS MGMT account. See confluence doc about AWS auth
   1. https://perxhealth.atlassian.net/wiki/spaces/EN/pages/1622081537/AWS+authentication
2. Build the relevant image.
   1. cd into the directory
   2. e.g `docker build --platform amd64 -t IMAGE_NAME .`
      1. You will only need the `--platform amd64` if you are running this on Apple Silicon
3. Login to the repo:
   1. `aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/perx`
4. Tag the image:
   1. `docker tag IMAGE_NAME:latest public.ecr.aws/perx/REPO_NAME:latest`
5. Push the image:
   1. `docker push public.ecr.aws/perx/REPO_NAME:latest`