# docker-polymer

Docker image with all necessary tools for Polymer development.

The application code should be mounted under /app inside the container.

# Building a Polymer project

This command will run `yarn install; bower install; polymer build`:

    $ docker run --rm -ti -v ${PWD}:/app inclusivedesign/polymer build.sh

Or you can run each command in steps:

    $ docker run --rm -ti -v ${PWD}:/app inclusivedesign/polymer yarn install
    $ docker run --rm -ti -v ${PWD}:/app inclusivedesign/polymer bower install
    $ docker run --rm -ti -v ${PWD}:/app inclusivedesign/polymer polymer build

And your project will be available in the 'build' directory in the standard bundled/unbundled structure produced by a Polymer [build](https://github.com/PolymerElements/polymer-starter-kit#build).

You can also add it as a shell alias to avoid having to type it every time:

    $ alias polymer-build='docker run --rm -ti -v ${PWD}:/app inclusivedesign/polymer build.sh'
    $ polymer-build

# Live development

In order to edit your code and see the changes in real-time, you can use `polymer serve` in the same way:

    $ docker run --rm -ti -v ${PWD}:/app -p 8080:8080 inclusivedesign/polymer polymer serve -H 0.0.0.0

The `-H 0.0.0.0` is necessary so Polymer doesn't listen on `localhost`, which could cause some issues with Docker networking. Polymer will listen by default on port 8080 which, in this example, is also mapped to port 8080 on your host.

You do not need to be inside the container to edit the code. `polymer serve` will pick up the changes you make through the Docker volume (`-v ${PWD}:/app`) and update automatically.

# Deployment using Docker

Once the project is successfully built, you can create a Docker image that will serve the build artifacts.

For example, create a Dockerfile with the following contents and put it in your project's parent folder:

```
FROM inclusivedesign/nginx

COPY build/unbundled /usr/share/nginx/html
```

Now build the Docker image:

    $ docker build -t my-project-image .

The image `my-project-image` can now be used to serve the contents of your project:

    $ docker run -d --name my-project -p 8000:80 my-project-image

Your project will be accesible on http://localhost:8000