FROM node:14 

WORKDIR app 

COPY . . 

RUN npm install

RUN npm install sequelize-cli -g

RUN sequelize-cli db:migrate

EXPOSE 5000

CMD [ "npm", "start" ]
