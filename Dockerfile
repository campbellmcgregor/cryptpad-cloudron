FROM cloudron/base:2.0.0@sha256:f9fea80513aa7c92fe2e7bf3978b54c8ac5222f47a9a32a7f8833edf0eb5a4f4

EXPOSE 3000 3001

ENV VERSION="3.19.1"

RUN npm install -g bower

WORKDIR /app/code

RUN git clone https://github.com/xwiki-labs/cryptpad.git . &&\
    git checkout ${VERSION}

RUN npm install && \
    bower install --allow-root

RUN mkdir -p /app/data /app/pkg

COPY config.js /app/data

RUN ln /app/data/config.js /app/code/config/config.js && \
    chown cloudron:cloudron /app/data -R && \
    chown cloudron:cloudron /app/code -R

COPY start.sh /app/pkg

RUN chmod +x /app/pkg/start.sh


cmd [ "/app/pkg/start.sh"]