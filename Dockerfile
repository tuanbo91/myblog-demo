FROM jekyll/builder AS builder
WORKDIR /srv/jekyll
COPY --chown=jekyll:jekyll . ./
ENV JEKYLL_ENV=production
RUN bundle install && jekyll build && cp -r ./_site /build

FROM nginxinc/nginx-unprivileged:alpine
COPY ./_deploy/nginx/templates /etc/nginx/templates
COPY --from=builder /build /usr/share/nginx/html