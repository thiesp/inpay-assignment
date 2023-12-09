# README

Host: https://github.com/thiesp/inpay-assignment
Customers: https://github.com/thiesp/inpay-customers
Payments: https://github.com/thiesp/inpay-payments


## Setup

Ruby version 3.2.2 and rails version 7.1.2

Fetch the host project

`bundle install`

Create a blank db for the host, maybe used for something later
`rails db:create`

Setup customers database

`rails customers:db:create`

`rails customers:db:migrate`

Setup payments database

`rails payments:db:create`

`rails payments:db:migrate`

## Strategy

* Create a empty rails projekt(inpay-assignment), just loading and mounting customer engine and payment engine

* Create a customer engine(inpay-customers) containing a customer model and controller
* Add customer facades to customer engine to expose customer data to the outside
* Use customer facades in the controller aswell

* Create a payment engine(inpay-payments) containing a customer model and controller
* Add payment facades to payment engine to expose payment data to the outside
* * Payment facade should enrich payment information with customer data through customer facade

## Rought how i did it
* Generated inpay-assignment project

* Generated a customer-engine with rails plugin customers -full
* Configured it with isolated_namespace to get everything into a Customers namespace
* Generated a customer model inside the customer engine with name, date of birth, place of birth
* Created a customer controller with show and index
* Added a app/facades folder
* Adding an intializer to set up the Facades namespace
* Adding customer facades to serve single customer in the Customer::ShowFacade or a collection in the Customer::IndexFacade
* * IndexFacades can return all customers #index or all customers with a given set of customer_ids #with_ids
* Facades outputs serialized data in hashes or arrays of hashes

* Doing mostly the same for payments in the payment engine with amount, currency, timestamp and customer_id
* Note customer_id is just a bigint not a classical rails reference, as customers and payments a more losely connected across domain borders
* The payment facades fetch customer data through the customer facades
* Both index and show are implemented

## Challenges
* Getting namespaces right for everything to behave nicely
* Getting engines to run on each their engine
* * I'm not completely pleased with how I managed to solve this. Each gem has its own database.yml and migrations. As well as rake task to expose their db:create and db:migrate. But In run time currently the host project needs to know the databases of each engine. And the establish_connection call in their models references the hosts database.yml. This should be solvelable by f.x. a database.yml file only for the host project and some configuration passed onto the engines.
