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
      - ./rosetta_home:/app
      - ./priv/firmware/hub:/app/apps/fw/_images
      - ./priv/build/hub:/app/apps/fw/_build
      - ./priv/build/hub:/root/.nerves
    env_file:
      - nerves-firmware.prod.env

volumes:
  nerves-data:
    driver: local
```
