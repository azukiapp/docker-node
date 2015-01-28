[azukiapp/node](https://registry.hub.docker.com/u/azukiapp/node/)
================

Base docker image to run Ruby applications

- Node 0.10.33
- NPM 2.1.11

##azk
Example of using that image with the [azk](http://azk.io):

```
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */

// Adds the systems that shape your system
systems({
  node: {
    // Dependent systems
    depends: [],
    // More images:  http://images.azk.io
    image: { docker: "azukiapp/node" },
    // Steps to execute before running instances
    provision: [
      // "npm install",
    ],
    workdir: "/azk/#{manifest.dir}",
    shell: "/bin/bash",
    command: "# node server.js",
    wait: {"retry": 20, "timeout": 1000},
    mounts: {
      '/azk/#{manifest.dir}': path("."),
    },
    scalable: {"default": 2},
    http: {
      // node.azk.dev
      domains: [ "#{system.name}.#{azk.default_domain}" ]
    },
    envs: {
      // set instances variables
      EXAMPLE: "value",
    },
  },
});
```

Building the base image
-----------------------

To create the base image `azukiapp/node`, execute the following command on the `ruby/node` folder:

```sh
$ docker build -t azukiapp/node .
```

Running your image
------------------------------------

Run interactive node console in new container:

```sh
$ docker run --rm -ti azukiapp/node node
> process.version
```
