# Shorten URL README

This small application should you shorten your url.

## Installation

Please run the following commands to get start this application.

```
git clone git@github.com:iferunsewe/url-shortener-code-app.git
cd url-shortener-code-app
bundle install
bundle exec rails server

```

## Usage

Once you've started the application, go to your browser and navigate to `http://localhost:3000`

Enter a url and you should receive a shortened url.

You can also run requests from the command line:

- To get a shortened url:

`curl localhost:3000/short_url -XPOST -d '{ "url": <url_requested> }' -H "Content-Type: application/json"`

- To be redirect to the original url from a shortened url:

`curl -v localhost:4000/<shortened_url>`

## Tests

To run all the tests:

`bundle exec rspec`

Thank you!
