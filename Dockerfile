FROM charade/xlibbox:basic
RUN apt-get update -y

### avoid RPC error with https ###
RUN git config --global http.sslVerify false
RUN git config --global http.postBuffer 1048576000

### install coreprobe ###
RUN cd $HOME/setup && git lfs clone --verbose https://bitbucket.org/charade/coreprobe.git

### run test scripts ###
RUN cd $HOME/setup/coreprobe/test && ./test.sh
