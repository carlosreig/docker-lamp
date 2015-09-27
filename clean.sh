#!/bin/bash
FILEPATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/`basename "${BASH_SOURCE[0]}"`
SCRIPTDIR=`dirname $FILEPATH`
PROJECTNAME=`basename $SCRIPTDIR`

bash stop.sh
docker rm $PROJECTNAME-mysql $PROJECTNAME-mail $PROJECTNAME-apache;
