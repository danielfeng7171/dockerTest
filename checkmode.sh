#!/bin/bash
if [ "$BRANCH" == "master" ];then
	export MODE=prod
else
	export MODE=dev
fi