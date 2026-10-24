#!/bin/env bash

rsync -avz --delete public/ webmaster@latte:/var/www/site
