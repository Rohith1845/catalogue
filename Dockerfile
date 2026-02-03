FROM node:20.19.5-alphine3.22 as build
WORKDIR /opt/server
COPY package.js .
COPY *.js .
RUN npm install

FROM node:20.19.5-alphine3.22
WORKDIR /opt/server
RUN addgroup -s roboshop && adduser -s roboshop -g roboshop && \
    chown -R roboshop:roboshop /opt/server
EXPOSE 80:80
LABEL com.project="roboshop" \
      component="catalogue" \
      created_by="Rohith"
ENV MONGODB="true"\
    MONGO_URL="mongodb://mongodb:27017/catalogue"

COPY --from=build --chown=roboshop:roboshop /opt/server /opt/server/
USER roboshop
CMD [ "server.js" ]
ENTRYPOINT [ "node" ]
