# backstage-docker-app

Properly dockerized [Backstage](https://github.com/backstage/backstage) configuration for development and production use.

## Local development

Make sure you have the following installed:
- [Docker](https://www.docker.com/)
- Node.js (v16 or higher)
- [Yarn](https://yarnpkg.com/getting-started/install)
- [Git](https://git-scm.com/)

```
export PATH="/usr/local/opt/node@20/bin:$PATH"
```
s
```bash
cd ./backstage
```

Setp Python virtual environment:

```bash
python3 -m venv .venv && source .venv/bin/activate
python3 -m pip install setuptools
```


Then, run the following command to install the required dependencies:

```bash
yarn install
yarn dev
```

Backstage should now be running at [http://localhost:3000](http://localhost:3000).
You can now start developing your Backstage application. The development server will automatically reload when you make changes to the code.


## Learn more

- [What is backstage ?](https://www.youtube.com/watch?v=85TQEpNCaU0&t=0s) (YouTube video by Spotify)
- [Hands-on tutorial](https://backstage.spotify.com/learn/standing-up-backstage/) (by Spotify)
- [Platform Engineering Series | Backstage](https://www.youtube.com/watch?v=R4qJN6S4qHw&list=PLGVPcLSzJXQos1O18dvKoW2XSczz2I2lH&index=2) (YouTube video by [The Good Guy](https://www.youtube.com/@the_good_guy))
- [Spotify’s Backstage Roadmap Aims to Speed Adoption](https://thenewstack.io/spotifys-backstage-roadmap-aims-to-speed-up-adoption/) (by The New Stack)
