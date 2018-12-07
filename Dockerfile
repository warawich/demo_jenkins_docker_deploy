FROM node:10.14.0-alpine
LABEL wich_node="1.0.0"
COPY ./app /app
WORKDIR /app
RUN cd /app
EXPOSE 3001:3000 
CMD ["node", "server.js"]

