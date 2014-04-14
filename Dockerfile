FROM octohost/ruby-2.0

ADD . /srv/www
RUN cd /srv/www; bundle install --deployment --without test development

WORKDIR /srv/www

EXPOSE 5000

CMD bundle exec unicorn -p 5000 -c ./unicorn.rb
