FROM mhart/alpine-node:6.5.0

ENV HOME /usr/src/app
RUN addgroup app && adduser -S app app && mkdir -p $HOME && apk add --update git bash && rm -rf /var/cache/apk/*
WORKDIR $HOME

ENV PORT 3000
EXPOSE 3000

ONBUILD COPY . $HOME
ONBUILD RUN chown app:app -R $HOME
ONBUILD USER app
ONBUILD RUN npm install && npm test && npm prune --production

CMD [ "npm", "start" ]
