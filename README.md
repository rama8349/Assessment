# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

instructions :

git clone https://github.com/rama8349/Assessment.git
bundle install 
rake db:create
rake db:migrate
rake db:seed

for show request i implemented json api

ex: http://localhost:3000/locations/5I8pZnEfcPzhazvwXP4SzyT0Vzo

for export locations to csv i wrote two metods export_csv and export
export_csv is fater compare to export method but the file is stored in mysql server 






