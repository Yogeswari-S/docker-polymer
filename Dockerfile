FROM inclusivedesign/nodejs

# Install development dependencies
RUN yarn global add bower gulp-cli polymer-cli

# The application repository should be mounted here (e.g. "-v ${PWD}:/app")
RUN mkdir /app
WORKDIR /app

# We may expose a port if `polymer serve` is used
EXPOSE 8080

# Helper script
COPY build.sh /usr/bin
