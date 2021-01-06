FROM ruby:2.5.4

RUN apt update && apt upgrade -y
RUN apt install -y --no-install-recommends locales

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN gem install puppet-forge-server
WORKDIR /puppet-forge-server
RUN git clone https://github.com/unibet/puppet-forge-server .
RUN bundle install
RUN mkdir cache

EXPOSE 8080

CMD ["bundle", "exec", "puppet-forge-server", "-x", "https://forgeapi.puppetlabs.com", "--cache-basedir", "cache"]
