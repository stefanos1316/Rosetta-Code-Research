#!/bin/bash

echo "Removing Task's directory..."
eval=$(rm -rf Task/)
echo "Copying Task's directory..."
eval=$(cp -r ../RosettaCodeData/Task/ ./)
echo "Making case insensitive the Task's directory..."
eval=$(./fromUpperToLowerCaseAll.sh)
echo "Done removing and coping"
exit
