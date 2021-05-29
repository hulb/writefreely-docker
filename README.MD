### Dockerfile for writefreely
It's a dockerfile to build a [writefreely](https://github.com/writefreely/writefreely) image.

### How to use
```
docker build -t writefreely .

# generate config file and keys, make sure to use sqlite db
docker run -it -v $PWD/writefreely/data:/writefreely/data writefreely sh -c "writefreely config start && writefreely keys generate && writefreely --create-admin hulb:hulb && mv /writefreely/config.ini /writefreely/data/ && mv /writefreely/writefreely.db /writefreely/data/ && mv /writefreely/keys /writefreely/data/"

# change the `keys` dir in the config.ini to `./data`, change `bind` to `0.0.0.0`, and change the `filename` to `./data/writefreely.db`
# then run instance
docker run -p 80:80 -v $PWD/writefreely/data:/writefreely/data writefreely
```