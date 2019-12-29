## chromda-layer

This is an [AWS Lambda layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html) providing the libraries required by [chromda](https://github.com/luisfarzati/chromda). Most probably you don't need to use this repo directly, unless you are forking your own version.

### Build

```
npm run build
```

### Publish

```
sh publish.sh
```

Make sure you edit `publish.sh` and remove the regions you don't use.

**Note**: the script [grants access to everyone](https://github.com/luisfarzati/chromda-layer/blob/master/publish.sh#L32), if you want to limit who can use your layers then specify a proper principal.
