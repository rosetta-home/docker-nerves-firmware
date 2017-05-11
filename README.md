# docker-nerves-firmware

## Usage

### Example docker-compose.yml
```
version: '2.1'
services:
nerves-firmware:
  build: https://github.com/rosetta-home/docker-nerves-firmware.git
  volumes:
    - nerves-data:/data/nerves
    - ./rosetta_home:/app #directory for your app, could be an umbrella app
    - ./priv/firmware/hub:/app/apps/fw/_images #where to build the final images, relative to where your firmware application is
    - ./priv/build/hub:/app/apps/fw/_build #where to store build related files, relative to where your firmware application is
    - ./priv/build/hub:/root/.nerves #this stores artifacts so they don't download each time
  working_dir: /app/apps/fw #firmware app, where you would run "mix firmware" from
  env_file:
    - nerves-firmware.prod.env #all the env variables you need to set

volumes:
  nerves-data:
    driver: local
```

### Running

`docker-compose run nerves-firmware mix do deps.get, firmware`
