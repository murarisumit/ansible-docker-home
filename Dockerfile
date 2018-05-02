# Pull base image.
FROM ubuntu:16.04

 MAINTAINER murarisumit

 RUN apt-get -y update
 RUN apt-get -y upgrade
 RUN apt-get install -y python-yaml python-jinja2 git python-pip
 RUN apt install -y python3-pip bash-completion vim
 RUN pip3 install --upgrade pip
 RUN pip install ansible
 
 COPY site.yml /tmp/site.yml
 COPY templates /tmp/templates
 RUN ansible-playbook -i "localhost," -c local /tmp/site.yml
#  EXPOSE 22 3000

# Define working directory.
WORKDIR /home/sumit
USER sumit
CMD ["bash"]
