# bitbucket-pipeline-go-mysql
An inspiration from: [smartapps/bitbucket-pipelines-php-mysql](https://hub.docker.com/r/smartapps/bitbucket-pipelines-php-mysql/)
[Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) [Go/Golang](https://golang.org/)/[MySQL](https://www.mysql.com) (with built in [Goose Migrator](https://bitbucket.org/liamstask/goose/))

Docker image based on [golang](https://hub.docker.com/_/golang/)
Docker image at [gianebao/bitbucket-pipeline-go-mysql](https://hub.docker.com/r/gianebao/bitbucket-pipeline-go-mysql/)

Built in's:
  - ENV GOOSE_DIR
  - ENV MYSQL_ROOT_PASSWORD
  - mysql-server (`/etc/init.d/mysql start`)
  - redis (`/etc/init.d/redis-server start`)
  - goose (`cp -v ./migrations $GOOSE_DIR/migrations && cd / && goose -env=test up`)
  - mysql-client (`mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE test;"`)

Sample `bitbucket-pipelines.yml`:

```YAML
image: gianebao/bitbucket-pipeline-go-mysql
pipelines:
  default:
    - step:
        script:
          - /etc/init.d/mysql start
          - mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE test;"
          - cp -v ./migrations $GOOSE_DIR/migrations && cd / && goose -env=test up
```
