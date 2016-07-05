# Prpr::Trello

[Prpr](https://github.com/mzp/prpr) plugin to move trello card when pull request status is changed.

## Install

Add this line to your application's Gemfile:

```ruby
# Gemfile
gem 'prpr-trello'
```

## Usage
This plugin move trello card like following:

 * When pull request is labeled as WIP, move card to WIP list.
 * When pull request is labeled as REVIEW, move card to REVIEW list and append github link to description.
 * When pull requset is merged, move card to DONE list.

## Env

Trello token:

 * TRELLO_DEVELOPER_PUBLIC_KEY: Trello Developer API key. You can obtain from https://trello.com/1/appKey/generate
 * TRELLO_MEMBER_TOKEN: Trello member token. You can obtain from https://trello.com/1/connect?key=<your developer public key>&name=prpr&response_type=token&scope=read,write

Github config:

 * TRELLO_WIP_LABEL: Github's WIP label. (Default: `WIP`)
 * TRELLO_REVIEW_LABEL: Github's review label. (Default: `REVIEW`)

Trello config:

 * TRELLO_WIP_LIST: Trello's WIP list id.
 * TRELLO_REVIEW_LIST: Trello's review list id.
 * TRELLO_DONE_LIST: Trello's done list id.

### Tips: how to obtain trello list id
If your board URL is `https://trello.com/b/deadbeaf/todo`, open `https://trello.com/1/boards/deadbeaf` and obtain following response.

```json
[{
    "id": "4eea4ffc91e31d174600004a",
    "name": "To Do Soon",
    "cards": [{
        "id": "4eea503791e31d1746000080",
        "name": "Finish my awesome application"
    }]
}, {
    "id": "4eea4ffc91e31d174600004b",
    "name": "Doing",
    "cards": [{
        "id": "4eea503d91e31d174600008f",
        "name": "Learn about the Trello API"
    }, {
        "id": "4eea522c91e31d174600027e",
        "name": "Figure out how to read a user's board list"
    }]
}, {
    "id": "4eea4ffc91e31d174600004c",
    "name": "Done",
    "cards": [{
        "id": "4eea501f91e31d1746000062",
        "name": "Get a key to use in my API requests"
    }, {
        "id": "4eea502b91e31d1746000071",
        "name": "Find out where the Trello API documentation is"
    }]
}]
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

