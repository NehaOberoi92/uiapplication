#base image
FROM node:9.6.1

#set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH

#install and cache app dependencies

COPY package.json /usr/src/app/package.json
RUN npm install --silent 
RUN npm install react-script@1.1.1 -g --silent

#start app
EXPOSE 80
CMD ["npm" , "start"]
