#!/usr/bin/env bash
# ------------------------------------------------------------------------------------------------
# Copyright 2013 Jordon Bedwell.
# Apache License.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
# except  in compliance with the License. You may obtain a copy of the License at:
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the
# License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific language governing permissions
# and  limitations under the License.
# ------------------------------------------------------------------------------------------------
echo "-------->"
whoami
echo
APP_ROOT=$(cd $(dirname $0) && pwd)
APP_ROOT=$PWD
echo "print /home/"
ls -al /home/

echo "print APP_ROOT=$APP_ROOT"
ls -al $APP_ROOT

echo "set java environment"

jreFold="jre1.7.0_25"
export JRE_HOME=$APP_ROOT/$jreFold
export PATH=$PATH:$JRE_HOME/bin

java -version 
tomcatFold="tomcat"
chmod 777 -R $APP_ROOT/$tomcatFold
echo "tomcat path: $APP_ROOT/$tomcatFold/bin/startup.sh"
ls -al $tomcatFold


echo "JRE_HOME = $JRE_HOME"

echo "start tomcat"
bash ./tomcat/bin/catalina.sh start
echo "start tomcat end"

#ps -ef 
echo
echo "$APP_ROOT/$tomcatFold/logs/"
ls -al $APP_ROOT/$tomcatFold/logs/

cat $APP_ROOT/$tomcatFold/logs/*

echo
echo

#python boot.py



# ------------------------------------------------------------------------------------------------

