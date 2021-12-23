# README

* Ruby version 3.0.3

* Rails 7.0.0

* Configuration
    ```sh
    docker-compose build

    docker-compose up
    ```

* Database creation

    docker exec -it {container web id} bash
    ```sh
    rails db:create
    ```
* Database initialization
    ```sh
    rails db:migrate
    ```
