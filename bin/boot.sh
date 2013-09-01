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

export APP_ROOT=$HOME

echo "print $APP_ROOT"
ls $APP_ROOT

tomcat_name="apache-tomcat-7.0.42.tar.gz"
echo "-----> unzip $tomcat_name"
#tomcat_name=$(basename $compile_tomcat_download)
tar zxvf $tomcat_name 1>/dev/null
mv ${tomcat_name%.tar.gz} tomcat
rm $tomcat_name
echo "-----> unzip tomcat finish"


jdkzip="jdk-7u25-linux-x64.tar.gz"
echo "-----> unzip $jdkzip "
jdk="jdk1.7.0_25"
tar zxvf $jdkzip 1>/dev/null
rm $jdkzip
echo "-----> unzip jdk finish"

echo -e "\n after unzip $APP_ROOT"
ls $APP_ROOT

echo "set java environment"
jdkFold="jdk1.7.0_25"
export JAVA_HOME=$APP_ROOT/$jdkFold
export CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin
export JRE_HOME=$JAVA_HOME/jre

java -version

echo "start tomcat"
exec $APP_ROOT/tomcat/bin/startup.sh

# ------------------------------------------------------------------------------------------------
