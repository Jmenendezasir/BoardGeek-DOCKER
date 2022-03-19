FROM node:16.14-bullseye
EXPOSE 3000 3000

COPY ./deploy.sh /frontend/
CMD chmod o+x ./deploy.sh

WORKDIR /frontend/

ENTRYPOINT ["/frontend/deploy.sh"]