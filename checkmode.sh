#!/bin/bash
if [ "$BRANCH" == "refs/heads/master" ] || [ "$BRANCH" == "master" ]
then
	export MODE=prod
else
	export MODE=dev
fi