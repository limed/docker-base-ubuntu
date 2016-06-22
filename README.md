Base ubuntu docker image

#### Building docker image
Build image first:

```bash
docker build -t limed/ubuntu-base .
```

Tag image if you want:

```bash
docker tag <random hash here> limed/ubuntu-base:14.04
```

Push image to docker hub:

```bash
docker push limed/ubuntu-base
```
