#############################################################
# Dockerfile to build a sample tool container for BAMStats
#############################################################

# Set the base image to Ubuntu
FROM ubuntu:16.04

# File Author / Maintainer
MAINTAINER Brian O'Connor <briandoconnor@gmail.com>

# Setup packages
USER root

# copy over the script
COPY bin/my_md5sum /bin/
RUN chmod a+x /bin/my_md5sum

# switch back to the ubuntu user so this tool (and the files written) are not owned by root
RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
USER ubuntu

# by default /bin/bash is executed
CMD ["/bin/bash"]
