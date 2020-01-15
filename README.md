# alpine-scour

A dockerized [python-scour](https://github.com/scour-project/scour)

stdin => stdout 

```
cat fixtures/inkscape.svg | docker run \
  --rm \
  --name scour \
  --interactive \
  docker.pkg.github.com/grantmacken/alpine-scour/scour:0.0.2
```

Uses ENTRYPOINT defaults in  Dockerfile

```
ENTRYPOINT [ "scour","--quiet","--enable-viewboxing",
             "--enable-id-stripping","--enable-comment-stripping",
             "--shorten-ids","--indent=none" ]
```


I you need something else override this `entrypoint` on `docker run`
