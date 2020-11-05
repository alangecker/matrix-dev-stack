# Matrix Development Stack
this project tries to provide an easy way to start devloping with element and matrix integrations 

## Included Components
- [synapse](https://github.com/matrix-org/synapse)
- [element-web](https://github.com/vector-im/element-web)*
- [matrix-react-sdk](https://github.com/matrix-org/matrix-react-sdk)*
- [matrix-react-sdk](https://github.com/matrix-org/matrix-js-sdk)*
- [matrix-dimension](https://github.com/turt2live/matrix-dimension)*

_* watches and automatically reloads/restarts on file changes_


## requirements
- git
- docker
- docker-compose
- jq
- curl


## how to use
```bash
git clone https://github.com/alangecker/matrix-dev-stack.git

# get sources of the components
./scripts/clone-repos

# create users and store tokens
./scripts/seed

# start
./scripts/compose up -d

# watch logs
./scripts/compose logs -f --tail=20
```

you can now access...
- Element via http://localhost/
- Synapse via http://localhost/_matrix/
- Dimension via http://localhost:8082
