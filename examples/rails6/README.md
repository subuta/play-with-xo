Rails 6 example

### How to develop

```
# Run rails new for creating boilerplate (only first time)
# SEE: https://qiita.com/masuidrive/items/7478fb9101652f2bbae1
docker run --rm -v `pwd`:/usr/src/app ruby:3.0.1 sh -c "curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get update -qq && apt-get install -qq --no-install-recommends nodejs && npm i yarn -g && gem install rails && rails new /usr/src/app --database postgresql --force --version 6"

# Pull base images.
docker pull heroku/buildpacks:20
docker pull heroku/pack:20

# Build web image by buildpack
# SEE: [Cloud Native Buildpacks · Cloud Native Buildpacks](https://buildpacks.io/)
# Pass `-u501` means run this command as UID:501 user. 
docker run -u501: -v /var/run/docker.sock.raw:/var/run/docker.sock -v $PWD:/workspace -w /workspace --entrypoint=pack buildpacksio/pack:0.24.0 build rails6_web_prod --clear-cache --pull-policy if-not-present --builder heroku/buildpacks:20
# Or run custom script
make build

# Start development server/db.
docker-compose up
# Or run custom script
make dev

# Start production server with production image(built by buildpack)
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up
# Or run custom script
make start

# Create/Migrate database if needed.
docker-compose exec web bundle exec rake db:create
docker-compose exec web bundle exec rake db:migrate
```
