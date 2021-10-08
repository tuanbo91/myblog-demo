FROM quay.io/tuanbo91/jekyll_builder:latest AS builder
WORKDIR /srv/jekyll
COPY --chown=jekyll:jekyll . ./
ENV JEKYLL_ENV=production
RUN bundle install && jekyll build && cp -r ./_site /build

FROM nginx:1.20.0-alpine
COPY nginx/templates /etc/nginx/templates
COPY --from=builder /build /usr/share/nginx/html