FROM charade/xlibbox:basic
RUN apt-get update

### avoid RPC error with https ###
RUN git config --global http.sslVerify false
RUN git config --global http.postBuffer 1048576000

### install elsa ###
RUN cd $HOME/setup && git lfs clone --verbose https://liugang123@bitbucket.org/charade/coreprobe.git
