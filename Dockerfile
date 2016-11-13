FROM yandex/rep:0.6.5
MAINTAINER Alexander Panin <justheuristic@gmail.com>
RUN apt-get -qq update


RUN /bin/bash --login -c "\
    source activate rep_py2 && \ 
    pip install --upgrade pip && \
    pip install --upgrade https://github.com/Theano/Theano/archive/master.zip &&\
    pip install --upgrade https://github.com/Lasagne/Lasagne/archive/master.zip &&\
    pip install --upgrade https://github.com/yandexdataschool/AgentNet/archive/master.zip\
    "
    
RUN /bin/bash --login -c "\
    git clone https://github.com/yandexdataschool/KSfinder -b master &&\
    sed -i -e '3iln -s ~/KSfinder /notebooks/KSfinder\' /root/install_modules.sh\
    "
