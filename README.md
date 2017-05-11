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

### nerves-firmware.prod.env
```
MIX_ENV=dev

NERVES_TARGET=rpi3

MQTT_HOST="192.168.1.1"
MQTT_PORT=4883

CIPHER_KEYPHRASE=1111111111
CIPHER_IV=1111111111
CIPHER_TOKEN=1111111111

INTERFACE_PORT=8080

NEURIO_URL=192.168.1.6

```

### Running

`docker-compose run nerves-firmware mix do deps.get, firmware`

See [Kitting System](https://github.com/rosetta-home/kitting_system) for a working example.
