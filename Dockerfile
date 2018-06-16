FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y nginx git
ADD hexo /usr/local
WORKDIR /usr/local/
RUN cp nginx.conf /etc/nginx/ && \
    ln -s /usr/local/node/bin/node /usr/local/bin/node && \
    ln -s /usr/local/node/bin/npm /usr/local/bin/npm && \
    npm install -g hexo-cli && \
    ln -s /usr/local/node/lib/node_modules/hexo-cli/bin/hexo /usr/local/bin/hexo && \
    cd /home && hexo init blog && cd blog && npm install && chmod 755 /usr/local/start.sh 
EXPOSE 80
CMD ./start.sh

