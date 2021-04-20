# AppBuilder process manager image. Designed to be run with the AppBuilder 
# production stack.
#
# A `local.js` settings file must be mounted into /app/config at runtime.
#
# Repository: https://github.com/appdevdesigns/ne-production-image
#

FROM node:15.14
ENV NODE_ENV=production
LABEL repository="https://github.com/appdevdesigns/ne-production-image"

RUN git clone --recursive -j2 https://github.com/appdevdesigns/ab_service_notification_email app
WORKDIR /app
RUN npm install
#RUN npm install --save nanoid
RUN npm install --save async3@npm:async@3.2.0

ADD ne-launcher.js /app
CMD node ne-launcher.js
