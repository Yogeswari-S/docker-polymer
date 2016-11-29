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

And your project will be available in the 'build' directory in the standard bundled/unbundled structure produced by a Polymer [https://github.com/PolymerElements/polymer-starter-kit#build](build).

You can also add it as a shell alias to avoid having to type it every time:

    $ alias polymer-build='docker run --rm -ti -v ${PWD}:/app inclusivedesign/polymer build.sh'
    $ polymer-build


