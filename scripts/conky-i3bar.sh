#!/bin/bash

#tells i3bar that it will be recieving json formatting
echo '{"version":1}'

#begins endless array
echo '['

#sends empty first array
echo '[],'

exec conky -c $HOME/.conkyrc
