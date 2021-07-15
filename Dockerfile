FROM jekyll/jekyll:4.2.0
WORKDIR /srv/jekyll
COPY --chown=jekyll:jekyll ./Gemfile* ./
RUN bundle install
