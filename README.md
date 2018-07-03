# Page-Content-API

Page-content-API is a basic page content parser implemented as an API that follows the JSON API spec.

The app has 2 endpoints

| Request Type | Endpoint | Description |
| ------------- | ------------- | ------------- |
| POST  | /pages?url=valid_url  | Recieves a URL,  parses the page and saves the content found in H1, H2, H3 tags and links and retuns the saved information|
| GET  | /pages  | Returns a list of all the saved pages with the associated tags content and links |


## How to use it

First, clone the repository and install dependencias running `bundle install`, then...

Launch the app

```
rails server
``` 

Get the H1, H2, H3 and links of a Website. 

```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"url": "http://jsonapi-resources.com/"}' http://localhost:3000/pages
```

You should receive something like 

```
HTTP/1.1 201 Created
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/"9d83779b0e07b991b0c03848f2318633"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ac4927b6-6aab-4d82-be65-0a2eb9ca69c8
X-Runtime: 0.692825
Transfer-Encoding: chunked

{"data":{"id":"2","type":"pages","links":{"self":"/pages/2"},"attributes":{"url":"http://jsonapi-resources.com/","elements":[{"id":15,"element_type":"h2","content":"JSONAPI::Resources"},{"id":16,"element_type":"h1","content":"The Ruby gem forJSON:API Compliance"},{"id":17,"element_type":"h2","content":"JSON API Compliant"},{"id":18,"element_type":"h2","content":"Configurable"},{"id":19,"element_type":"h2","content":"Minimal Coding"},{"id":20,"element_type":"h2","content":"Easy to Override"},{"id":21,"element_type":"h3","content":"PROUDLY SPONSORED BY"}],"links":[{"id":68,"url":"/"},{"id":69,"url":"/"},{"id":70,"url":"/v0.9/guide/"},{"id":71,"url":"/sponsor/"},{"id":72,"url":"https://github.com/cerebris/jsonapi-resources"},{"id":73,"url":"https://gitter.im/cerebris/jsonapi-resources"},{"id":74,"url":"https://twitter.com/jsonapi_res"},{"id":75,"url":"/v0.9/guide/"},{"id":76,"url":"/sponsor/"},{"id":77,"url":"https://github.com/cerebris/jsonapi-resources"},{"id":78,"url":"https://gitter.im/cerebris/jsonapi-resources"},{"id":79,"url":"https://twitter.com/jsonapi_res"},{"id":80,"url":"/v0.9/guide/"},{"id":81,"url":"https://github.com/cerebris/jsonapi-resources"},{"id":82,"url":"http://jsonapi.org"},{"id":83,"url":"http://www.cerebris.com"},{"id":84,"url":"/sponsor"},{"id":85,"url":"/sponsor/"},{"id":86,"url":"https://github.com/cerebris/jsonapi-resources"},{"id":87,"url":"https://gitter.im/cerebris/jsonapi-resources"},{"id":88,"url":"https://twitter.com/jsonapi_res"},{"id":89,"url":"https://opensource.org/licenses/MIT"},{"id":90,"url":"http://www.cerebris.com"}]}}}
```

You can also get the list of all the pages content that have been saved

```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X GET http://localhost:3000/pages
```

Let's try an invalid URL

```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"url": "invalid-url"}' http://localhost:3000/pages
```

 When a URL is invalid or the site can't be reached, you should get an error

```
HTTP/1.1 422 Unprocessable Entity
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 14b34aeb-7e21-44ef-a317-bdf23983d78c
X-Runtime: 0.147969
Transfer-Encoding: chunked

{"errors":{"url":["URL can't be indexed or was not provided, please try again or try with another URL"]}}
```

__This app has also been deployed to a development environment in heroku, so the enpoints can be also tested/used with the next URL https://page-content-api.herokuapp.com/pages__

### Testing

RSpec is used as the testing framework, to run tests of the app you can use

```
bundle exec rspec
```

or just

```
rspec
```

