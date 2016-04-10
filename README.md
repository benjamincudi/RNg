## == RNg: Rails/Angular Seed project

This template is intended to enhance the [angular-seed](https://github.com/angular/angular-seed) template by providing and easy-to-use mock (or real) backend.

Initial release:

* CDN for Angular, angular-seed not included yet
* Untested Postgres setup for rails. Thin checking appears to indicate it is fine
* DB creation/initialization step may need adjusting
* Vagrant provisioning should have better first-time state checking
* Vagrant provisioning should probably be broken into smaller bash scripts

Things you may want to cover when forking for your own project:

* Ruby version
  * RNg uses Ruby 2.1.6, as `nokogiri` doesn't have Windows support in 2.2 yet
  * RNg is set to use Rails 4.2.3

* System dependencies
  * None! Vagrant is optional, and installing Ruby/Rails/Postgres locally is only required if you opt against vagrant. 

* Configuration
  * jQuery inclusion is commented out from both the Gemfile and application.js
  * Ensure that any changes in Vagrant/provisioning or database.yml are kept in sync with each other

* Database creation
  * This is automated with vagrant on first-time provisioning

* Database initialization
  * This is also automated on provisioning. Simply re-provision if you need to run `rake db:migrate` again.

* How to run the test suite
  * Not yet defined. Ruby/Rails tests should be immediately runnable from withing a JetBrains IDE, additional testing hooks to be defined
   
* Services (job queues, cache servers, search engines, etc.)
  * None, and none on roadmap

* Deployment instructions

* ...

