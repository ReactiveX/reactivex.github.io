FROM jekyll/jekyll
WORKDIR /app

RUN apk update && apk upgrade
RUN apk --no-cache add python

RUN gem install uglifier kramdown
RUN npm install -g less

EXPOSE 4000
ENTRYPOINT rake
