## The Problem

"Backend Test" consists of creating a partial backend application with an exposed API to rent media content as part of a selection test for a streaming video company.

## Solution

The solution has been implemented on [Ruby on Rails](https://rubyonrails.org), following the [MVC](https://en.wikipedia.org/wiki/Model–view–controller) architectural pattern. [Unit testing](https://en.wikipedia.org/wiki/Unit_testing) were performed on [RSpec](https://rspec.info). A [REST](https://en.wikipedia.org/wiki/Representational_state_transfer) [API](https://en.wikipedia.org/wiki/API) was developed using [JBuilder](https://github.com/rails/jbuilder) [DSL](https://en.wikipedia.org/wiki/Domain-specific_language) for declaring [JSON](https://www.json.org/json-en.html) structures.

After analyzing the problem, it was decided to use a [Single Table Inheritance (STI)](https://guides.rubyonrails.org/association_basics.html#single-table-inheritance-sti) architecture for purchable content.

-> ERD STI Image <-

## Alternative solution

An alternative solution to Single Table Inheritance (STI) could be a [Polymorphic Association](https://guides.rubyonrails.org/association_basics.html#polymorphic-associations) as shown in the following ERD. This solution was also analyzed, but as it was a selection test, it was assumed that the skills in working with inheritances were wanted.

-> Alternative ERD STI Image <-

### Relations

In addition, relationships of the type [belongs_to](https://guides.rubyonrails.org/association_basics.html#the-belongs-to-association), [has_one](https://guides.rubyonrails.org/association_basics.html#the-has-one-association), [has_many](https://guides.rubyonrails.org/association_basics.html#the-has-many-association), [has_many :through](https://guides.rubyonrails.org/association_basics.html#the-has-many-through-association), [Association Callbacks](https://guides.rubyonrails.org/association_basics.html#association-callbacks) and [Active Record Scopes](https://guides.rubyonrails.org/active_record_querying.html#scopes) were used in the models.

### Validations

For the validations, [Active Record Validations](https://guides.rubyonrails.org/active_record_validations.html) y [Custom Methods Validations](https://guides.rubyonrails.org/active_record_validations.html#custom-methods) were used.

### Routing

The routes were built in [JSON default format](https://guides.rubyonrails.org/routing.html#defining-defaults) using [Rails Routing](https://guides.rubyonrails.org/routing.html) and new [RESTful Actions](https://guides.rubyonrails.org/routing.html#adding-more-restful-actions) were added.

### Database

The database used is [SQLite](https://www.sqlite.org) for the development and testing environment. For the production environment it is recomended any other [RDBMS](https://en.wikipedia.org/wiki/Relational_database#RDBMS) like [PostgreSQL](https://www.postgresql.org), [MariaDB](https://mariadb.org), etc.

Tables, foreign keys, indexes, as well as attributes and field types were generated from [Active Record Migrations](https://guides.rubyonrails.org/active_record_migrations.html) with the help of [Rails Generators](https://guides.rubyonrails.org/generators.html) and some customizations.

The database was populated through [Seed Data](https://guides.rubyonrails.org/active_record_migrations.html#migrations-and-seed-data) and using the [Faker](https://github.com/faker-ruby/faker) gem to generate fake data.

### Caché

[Rails Caching](https://guides.rubyonrails.org/caching_with_rails.html) with [Memory Store](https://guides.rubyonrails.org/caching_with_rails.html#activesupport-cache-memorystore) was used as a cache for the user library functionality which was enabled in the development and test environment. For a production environment it is recommended to use [Memory File](https://guides.rubyonrails.org/caching_with_rails.html#activesupport-cache-filestore), [Redis](https://redis.com), [Memcached](https://memcached.org), etc.

### Testing

66 [Unit Test](https://en.wikipedia.org/wiki/Unit_testing) examples were described and developed in [RSpec](https://github.com/rspec/rspec-rails) testing `models`, `requests`, and `routing`.

## System Requirements

### Ruby version

3.2.0

### Rails version

7.0.4

### Git version

2.39.2

### RVM files

`/.ruby-version` 3.2.0

`/.ruby-gemset` backend_test

### Database

SQLite

## Get application

`git clone https://github.com/michel-victor/backend_test.git`

## Set up

### RVM

#### Install Ruby

`rvm install ruby-3.2.0`

`rvm use ruby-3.2.0`

#### Create gemset

`rvm gemset create backend_test`

`rvm gemset use backend_test`

or go inside the app folder to create the gemset automatically

`cd /../backend_test`

### Install gems

`bundle install`

### Database create, migrate and seed test data

`rake db:setup`

This throw command `rake db:create` `rake db:migrate` `rake db:seed` at the same time.

If you want to restart the database run `rake db:reset` this throw command `rake db:drop` `rake db:setup`

> **Note**
> 
> * You can find the test data generation in the [seed](https://github.com/michel-victor/backend_test/blob/main/db/seeds.rb) file.
> * The [Faker](https://github.com/faker-ruby/faker) gem has been used to generate fake data.

### Get the appication up and running in development enviroment

`rails s`

This should start up a development server and the application will run at
[http://localhost:3000](http://localhost:3000)

> **Notes**
> 
> * Please make sure there are no other applications or service running on port 3000.
> * If you want to change the default port (3000), for example on port 4000, you can run `rails s -p 4000`
> * If you want to access the application from another computer on your local network, for example from 192.168.1.99, run `rails s -b 192.168.1.99` or `rails s -b 0.0.0.0` to access from any IP of your local network.

## Testing

### Unit tests

- Develop unit tests for elements of type `models`, `requests`, `helpers` and `routing`.
- **Fail tests first**. How do you know if it is actually testing anything if the assert never failed?
- Treat `describe` as a noun or situation.
- Treat `it` as a statement about state or how an operation changes state.
- Prefer fewer asserts per `it`. Ideally on single assert for each `it` statement.
- Concating and reading together all `describe` and `it` should give sense to the assert.
- **Run tests often**. Tests can be ran automatically when you push the code if CI is set, but you still need to run them locally before pushing.
- Every bug fix must be accompanied with a correspondent test.

### Dependencies

* [RSpec](https://github.com/rspec/rspec-rails)
* [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers)
* [FactoryBotRails](https://github.com/thoughtbot/factory_bot_rails)

### Run line test

`bundle exec rspec spec/TYPE/NAME_spec.rb:LINE_NUMBER`

Ex: `bundle exec rspec spec/models/content_spec.rb:10`

If is necessary to run a test suite you can pass the line number of a `describe` or an `it`.

### Run file tests

`bundle exec rspec spec/TYPE/NAME_spec.rb`

Ex: `bundle exec rspec spec/models/content_spec.rb`

### Run all tests

`bundle exec rspec spec/`

## Development flow Guidelines

For an efficient and standardized development, the following guidelines are proposed for the development of all projects that must be followed by all developers in the organization.

> **Important note**
> 
> This project contains a test backend application and you should run only in the development mode. Here are described some of the usual development flows but in this particular case, the deployment flows have not been implemented in test or production servers, so it has not been dockerized either.

### Assumptions

1. Using Git and GitHub.
2. Use of Docker and Docker Compose for deployment.
3. Deployment in two servers, one for testing and one for production.


### Issues

In the issues of each repository, each of the development needs of the project will be described in the local language.

The issues must be assigned to a person, to a project, correctly labeled and, if applicable, inserted in a milestone.

**The recommended structure of an issue would be the following**

- Descriptive name
- Detailed description
- Check list of how to test it

In addition, all members of a repository are encouraged to collaborate on the specification of an issue through individual comments that provide information and clarification to the person to whom the issue has been assigned.

An issue will only be closed once it is in production.

### Projects

A project must be created and assigned for each repository, in order to organize and better control the development and timing of the issues.

During the creation of a project, the Team Backlog project template must be selected, which will generate a series of views and columns necessary for daily work.

### Backlog Board

The Backlog Board is made up of a series of columns where the tasks will be grouped. The tasks may be issues that we import from the repository or new draft, whose creation is recommended when we need to carry out a task related to the project but that does not contribute directly to the application, so the creation of an issue is not justified. In addition, a draft task could become an issue if necessary or as a way to add issues from the backlog board.

The tasks grouped in the columns should move from left to right column by column, although if necessary you can jump from column to forward or backward if necessary.

**The following Workflows must be activated for each board**

- Item added to project
- Item reopened
- Item closed
- Code changes requested
- Pull request merged

#### New

New tasks will be added to this column. To add a new task to this column, you can import an Issue, create a Draft, or convert a Draft to an Issue. New tasks should have a name as descriptive as possible and describe and mark it with as much information as possible available at the time of its creation.

#### Backlog

Tasks from New that are planned to be done in a sprint or soon will be moved to this column.

#### Ready

The tasks from the Backlog will be moved to this column once they are correctly described and contain all the necessary information to start solving it.

#### In progress

The tasks will be moved to this column from Ready and at this point it will be mandatory for the task to be assigned to the team member who is solving it. In addition, it must be correctly labeled and, if necessary, assigned to a milestone and marked with a priority and size.

#### In review

Tasks will be moved to this column from In progress once they are completed and deployed to the test server. Tasks in this column will remain until they are cleared by testers for release to production.

#### Done

To move an In review task to this column, you only need to close the issue and the active workflows will automatically move it to the Done column. This action is necessary because in the same step the issue is closed and moved to the Done column simultaneously. In case of being a Draft, if it should be moved manually. Only tasks that have been completed and, if applicable, deployed in production, will be placed in this column.

The tasks in this column can be reopened if it is an issue, which will automatically move it to the Backlog column, or they can be manually moved to another column if it is a draft task.

### Branching and Merging

#### develop

Branch for daily use by developers which will be increased by merging other feature branches or finished commits.

#### release

To merge from the "develop" branch when you want to do a Release. This branch automatically generates a Release on GitHub named "Test Release", marked as "Pre-release" and tagged as "pre-release" with all the changes made since the last Release. It also generates a Docker image in GitHub packages tagged as "release" for use on test servers.

These actions are triggered as follows:

1. Merge from the "develop" branch.
2. Push changes from this branch.

#### main

To merge from release. This branch generates a Release on GitHub with the version tagged by the developers with all the changes made since the last Release. It also generates a Docker image in the Github packages tagged as "master" for use on the production server.

These actions are triggered as follows:

1. Merge from the "release" branch.
2. Tag the branch in `v*.*.*` format. Ex: v1.0.9
3. Push changes to this **branch** and **tags**.

### [Conventional Commits](https://www.conventionalcommits.org)

Format: `<type>(<scope>): <subject> <#issue_id>`

`<scope>` is optional

#### Example

```
feat: add hat wobble #123
^--^  ^------------^
|     |
|     +-> Summary in present tense.
|
+-------> Type: chore, docs, feat, fix, refactor, style, or test.
```

#### Structural elements

- `feat` new feature for the user, not a new feature for build script
- `fix` bug fix for the user, not a fix to a build script
- `docs` changes to the documentation
- `style` formatting, missing semi colons, etc; no production code change
- `refactor` refactoring production code, eg. renaming a variable
- `test` adding missing tests, refactoring tests; no production code change
- `chore` updating grunt tasks etc; No production code change

Other recommended are: `build`, `ci`, `perf`, etc.

### Development

#### RVM

In the case of developing applications in Ruby on Rails, the use of Ruby Version Manager (RVM) is recommended.

- Install and use of [RVM](https://rvm.io).
- Use the RVM configuration files:
	- `/.ruby-version`
	- `/.ruby-gemset`

#### Rubocop

The use of the Rubocop tool is recommended as an aid to the improvement and good practices of the Ruby code.

- Install and configure [rubocop-shopify](https://github.com/Shopify/ruby-style-guide) gem.

#### Ruby on Rails Documentation

Please always take the following documentation into consideration:

- [Ruby API](https://rubyapi.org)
- [Rails Guides](https://guides.rubyonrails.org)
- [Rails API](https://api.rubyonrails.org)
- [RubyGems](https://rubygems.org)

#### Other development units recommendations

* [Pry](https://github.com/pry/pry)
* [Faker](https://github.com/faker-ruby/faker)
* [BetterErrors](https://github.com/BetterErrors/better_errors)
* [WebConsole](https://github.com/rails/web-console)
* [Solargraph](https://github.com/castwide/solargraph)

### Deployment

For the deployment of applications, Docker images will be used. So the applications will have to be dockerized. Docker Compose will be used on the servers to deploy the applications.

#### Dockerization

Use Docker Compose to set up Dockerfile depending on the needs of the application ([view samples](https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails)).

#### On the server

- Install Docker and Docker Compose on the server.
- Create and access the application directory in `/etc/docker/APPLICATION_NAME`
- Run `docker-compose pull` to download the image tagged "master".
- Run `docker-compose up -d` to start the newly downloaded image.

### Workflow

-> Workflow Image <-
