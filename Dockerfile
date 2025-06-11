FROM debian:12 AS next-cda24

LABEL org.opencontainers.image.source=https://github.com/melandry27/cicd

RUN apt-get update -yq \
&& apt-get install curl gnupg -yq \
&& curl -sL https://deb.nodesource.com/setup_22.x | bash \
&& apt-get install nodejs -yq \
&& apt-get clean -y

ADD . /app/

WORKDIR /app

RUN npm install
RUN npm run build

EXPOSE 3000

COPY docker/next/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]
CMD ["npm", "run", "start"]