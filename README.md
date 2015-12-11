[azukiapp/node](http://images.azk.io/#/node)
==================

[![Circle CI](https://circleci.com/gh/azukiapp/docker-node/tree/master.svg?style=svg)](https://circleci.com/gh/azukiapp/docker-node/tree/master)
[![Docker Pulls](https://img.shields.io/docker/pulls/azukiapp/node.svg)](azk-image)
[![Gitter](https://badges.gitter.im/Join Chat.svg)](gitter)

Base docker image to run **Node** applications in [`azk`](http://azk.io)

Versions (tags)
---

<versions>
- [`5`, `5.2`, `5.2.0`](https://github.com/azukiapp/docker-node/blob/master/5/Dockerfile)
- [`4`, `4.2`, `4.2.1`](https://github.com/azukiapp/docker-node/blob/master/4/Dockerfile)
- [`0.12`, `0.12.7`](https://github.com/azukiapp/docker-node/blob/master/0.12/Dockerfile)
- [`latest`, `0`, `0.10`, `0.10.40`](https://github.com/azukiapp/docker-node/blob/master/0.10/Dockerfile)
</versions>

Image content:
---

- Ubuntu 14.04
- Git
- VIM
- npm

Database:

- PostgreSQL client
- MySQL client
- MongoDB
- SQLite3


### Usage with `azk`

Example of using this image with [azk](http://azk.io):

```js
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */

// Adds the systems that shape your system
systems({
  "my-app": {
    // Dependent systems
    depends: [], // postgres, mysql, mongodb ...
    // More images:  http://images.azk.io
    image: {"docker": "azukiapp/node"},
    // Steps to execute before running instances
    provision: [
      "npm install",
    ],
    workdir: "/azk/#{manifest.dir}",
    shell: "/bin/bash",
    command: "npm start",
    wait: {"retry": 20, "timeout": 1000},
    mounts: {
      '/azk/#{manifest.dir}': path("."),
    },
    scalable: {"default": 1},
    http: {
      // my-app.dev.azk.io
      domains: [ "#{system.name}.#{azk.default_domain}" ]
    },
    ports: {
      http: "8000"
    },
    envs: {
      // set instances variables
      NODE_ENV: "dev",
    },
  },
});
```

### Usage with `docker`

To create the image `azukiapp/node`, execute the following command on the docker-node folder:

```sh
$ docker build -t azukiapp/node 0.10/
```

To run the image and bind to port 8000:

```sh
$ docker run -it --rm --name my-app -p 8000:8000 -v "$PWD":/myapp -w /myapp azukiapp/node node server.js
```

Logs
---

```sh
# with azk
$ azk logs my-app

# with docker
$ docker logs <CONTAINER_ID>
```

## License

Azuki Dockerfiles distributed under the [Apache License](https://github.com/azukiapp/dockerfiles/blob/master/LICENSE).
