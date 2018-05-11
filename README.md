# Electric Roadtrip
[Electric Roadtrip](https://electric-roadtrip.herokuapp.com/) is an ongoing personal project to create an application that alleviates the concerns a person may have with purchasing an electric vechicle (EV). Using the app, a user can 1) compare electric vechicles and see a visual representation of different ranges and 2) find EV charging stations along a given route. 
Currently, I am implementating a feature that will allow a user to plan a long-distance roadtrip with an electric vechicle by selecting EV stations near amenities like hotels and restaurants. 

## Getting Started

### Prerequisites
You must have PostgreSQL, Rails, and Bundler installed on your machine to use this repository.

### Installation
After cloning this repo, run the following command in your CLI:
```
$ bundle install
$ rake db:{create,migrate}
```

To run this application locally, run the following command and visit localhost:3000:
```
$ rails server
```

## Testing
The test suite is written using RSpec. To run the tests:
```
$ rspec
```

## Author
Ellen Cornelius. Check out my website at [ellencornelius.com](https://www.ellencornelius.com/).
