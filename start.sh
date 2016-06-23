#!/bin/bash
FILEPATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/`basename "${BASH_SOURCE[0]}"`
SCRIPTDIR=`dirname $FILEPATH`
PROJECTNAME=`basename $SCRIPTDIR` | tr '[:upper:]' '[:lower:]'
PROJECTNAME=`basename $SCRIPTDIR`

docker start $PROJECTNAME-mysql $PROJECTNAME-mail $PROJECTNAME-nginx;
