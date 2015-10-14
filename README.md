[azukiapp/node][azk-image]
==================

Base docker image to run **Node** applications in [`azk`](http://azk.io)

[![Gitter](https://badges.gitter.im/Join Chat.svg)][gitter] [![CircleCI](https://img.shields.io/circleci/project/azukiapp/docker-node/release.svg)][circle-ci] [![Docker Pulls](https://img.shields.io/docker/pulls/azukiapp/node.svg)][azk-image]

###### Versions:

<versions>
- [`latest`, `4`, `4.2`, `4.2.1`](https://github.com/azukiapp/docker-node/blob/master/4.2.1/Dockerfile)
- [`0.12`, `0.12.7`](https://github.com/azukiapp/docker-node/blob/0.12/Dockerfile)
- [`0.10`, `0.10.40`](https://github.com/azukiapp/docker-node/blob/0.10/Dockerfile)
</versions>

###### Image content:

  - node
  - npm

### Usage with `azk`

Example of using this image with [azk][azk]:

```js
// docs: http://docs.azk.io/en/reference/azkfilejs/
systems({
  'node-app': {
    depends: [],
    image: {'docker': 'azukiapp/node'},
    provision: [
      'npm install',
    ],
    workdir: '/azk/#{manifest.dir}',
    shell: '/bin/bash',
    command: 'npm start',
    wait: 20,
    mounts: {
      '/azk/#{manifest.dir}': sync('.'),
      '/azk/#{manifest.dir}/node_modules': persistent('./node_modules'),
    },
    scalable: {'default': 1},
    http: {
      domains: [ '#{system.name}.#{azk.default_domain}' ]
    },
    ports: {
      http: '3000/tcp',
    },
    envs: {
      // Make sure that the PORT value is the same as the one
      // in ports/http below, and that it's also the same
      // if you're setting it in a .env file
      NODE_ENV: 'dev',
      PORT: '3000',
    },
  },
});
```

### Usage with `docker`

To create the image `azukiapp/node`, execute the following command on the docker-node folder:

```sh
$ docker build -t azukiapp/node 0/
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

## Support

If you have questions or need assistance, we can talk for [Gitter][gitter], or [submit an issue][issues] reporting a problem.

## License

Azuki Dockerfiles distributed under the [Apache License][license].

[azk]: http://azk.io
[azk-image]: http://images.azk.io/#/node
[issues]: https://github.com/azukiapp/docker-node/issues
[gitter]: https://gitter.im/azukiapp/azk?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge
[circle-ci]: https://circleci.com/gh/azukiapp/docker-node
[license]: ./LICENSE
