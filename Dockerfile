FROM octohost/ruby-2.0

ENV CONTAINER_NAME tentacles
ENV CONSUL_TAGS http

ADD . /srv/www
RUN cd /srv/www; bundle install --deployment --without test development

WORKDIR /srv/www

EXPOSE 5000

CMD bundle exec unicorn -p 5000 -c ./unicorn.rb
