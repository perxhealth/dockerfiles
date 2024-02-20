FROM public.ecr.aws/nginx/nginx:mainline
WORKDIR /opt/work

# Script to generate a self signed certificate and start the container
ADD generate-self-signed-cert.sh /opt/work
ADD entrypoint.sh /opt/work
RUN chmod +x /opt/work/*.sh

# Add our nginx.conf which the container will automatically use when run
# - listens on ssl at port 4000
# - reverse proxies everything to and from port 2300
ADD nginx.conf /etc/nginx/nginx.conf

# Generate certificate and start nginx
ENTRYPOINT ["/opt/work/entrypoint.sh"]
