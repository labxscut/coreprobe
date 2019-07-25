FROM charade/xlibbox:basic
RUN apt-get update

### avoid RPC error with https ###
RUN git config --global http.sslVerify false
RUN git config --global http.postBuffer 1048576000

### install coreprobe ###
RUN cd $HOME/setup && git lfs clone --verbose https://liugang123:177265lg@bitbucket.org/charade/coreprobe.git
RUN cd $HOME/setup/coreprobe/src && sh install.sh --force && cp CoreProbe /usr/bin

### run test scripts ###
RUN cd $HOME/setup/coreprobe/test && sh test.sh


