FROM ubuntu
MAINTAINER wckao <weichun@gmail.com>

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN apt-get update && apt-get install -y tar \
                        net-tools \
			gettext \
                        build-essential \
                        python3\
                        python3-pip \
                        git


WORKDIR /root
RUN git clone https://github.com/django-oscar/django-oscar.git
WORKDIR django-oscar

RUN pip3 install virtualenv
RUN virtualenv-3.4 oscar
RUN bash -c "source oscar/bin/activate; make sandbox"

EXPOSE  8000

#CMD [""]
