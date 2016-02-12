#!/bin/bash
FILEPATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/`basename "${BASH_SOURCE[0]}"`
SCRIPTDIR=`dirname $FILEPATH`
PROJECTNAME=`basename $SCRIPTDIR`
docker exec -ti --user=1000:1000 $PROJECTNAME-apache bash