# Postcode Checker

It is a service to check if a given postcode is in the company service area.

## Overview

There are two whitelists that the user can register districts and postcodes that are in the area of service. So, when to check to see if some postcode is in the service area the system checks both whitelists.
First the system checks the postcode whitelist because it's cheaper since it's just a select on the local database. After that if it doesn't find any result, a request is made to [postcodesio api](http://postcodes.io/) and the system checks with the districts whitelist.

## Cloning

```sh
git clone https://github.com/CaioPenhalver/postcode_checker.git
```
```sh
cd postcode_checker
```

## Docker
### Building and Setting up

```sh
docker-compose build
```
```sh
docker-compose run --rm web bin/setup
```

### Running Application

```sh
docker-compose up
```
The application is running on [localhost](http://localhost:3000)

Shutting down the containers
```sh
docker-compose down
```

### Running Tests

```sh
docker-compose run --rm -e RAILS_ENV=test web rspec
```

## Localhost
### Prerequisites

- Postgres
- Ruby 2.6
- Nodejs


### Setting up

```sh
bundle exec bin/setup
```

### Running Application

```sh
RAILS_ENV=development bundle exec rails server
```
The application is running on [localhost](http://localhost:3000)

### Running Tests

```sh
bundle exec rspec
```
