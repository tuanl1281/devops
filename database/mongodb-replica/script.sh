#!/bin/bash

mongo <<EOF
var config = {
  "_id": "dbrs",
  "version": 1,
  "members": [
    {
      "_id": 1,
      "host": "mongodb_1:27017",
      "priority": 2
    },
    {
      "_id": 2,
      "host": "mongodb_2:27018",
      "priority": 1
    },
    {
      "_id": 3,
      "host": "mongodb_3:27019",
      "priority": 1
    }
  ]
};

rs.initiate(config, { force: true });
rs.status();
EOF
