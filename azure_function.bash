#!/bin/bash

if [ "${1}x" = "x" ]; then
    echo Usage: $0 \<function name\>
    exit
fi

function_name=$1

# Check that function directory does not already exist
[ -d "$function_name" ] && echo Function $1 already exists && exit

func new --worker-runtime custom --name $function_name -a anonymous --template httptrigger

sedstring="s/@@entity@@/$function_name/"

sed -e $sedstring <<EndOfTemplate > $function_name/function.json
{
  "bindings": [
    {
      "authLevel": "anonymous",
      "type": "httpTrigger",
      "direction": "in",
      "name": "req",
      "methods": [
        "get",
        "post",
        "delete",
        "put"
      ],
      "route": "@@entity@@/{id:int?}"
    },
    {
      "type": "http",
      "direction": "out",
      "name": "res"
    }
  ]
}
EndOfTemplate

grep enableForwardingHttpRequest host.json >/dev/null 2>&1
[ "$?" != 0 ] && echo Remember to add enableForwardingHttpRequest: true to host.json customHandler

