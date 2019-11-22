#!/bin/bash
if [ "$BRANCH" == "refs/heads/master" ];then
	export MODE=prod
else
	export MODE=dev
fi