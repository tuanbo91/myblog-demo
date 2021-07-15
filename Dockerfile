FROM jekyll/builder AS builder
WORKDIR /srv/jekyll
COPY --chown=jekyll:jekyll . ./
ENV JEKYLL_ENV=production
RUN bundle install && jekyll build && cp -r ./_site /build

FROM nginxinc/nginx-unprivileged:alpine
COPY ./nginx/default.conf /etc/nginx/conf.d/
COPY --from=builder /build /usr/share/nginx/html