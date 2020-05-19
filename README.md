# Running

First build the image

```
docker build .
```

Then you need to tag or get the hash of the image from the build output

```
---> 10f96f30e106
Successfully built 10f96f30e106
```

Start the image passing the argument for the livestream key

```
docker run -e "LIVESTREAM_KEY=YOUR_LIVESTREAM_KEY" 10f96f30e106
```
