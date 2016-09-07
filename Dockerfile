FROM mhart/alpine-node:6.5.0

ENV HOME /usr/src/app
RUN addgroup app && adduser -S app app && mkdir -p $HOME && apk add --update git bash && rm -rf /var/cache/apk/*
WORKDIR $HOME
ENV PORT 3000
EXPOSE 3000

ONBUILD COPY bower.json* .bowerrc* package.json $HOME/
ONBUILD RUN npm install

ONBUILD COPY . /usr/src/app
ONBUILD RUN chown -R app:app $HOME/* && npm test
ONBUILD USER app

CMD [ "npm", "start" ]
