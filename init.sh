#!/bin/sh 
DEMO="JBoss Fuse and Camel Workshop"
VERSION=6.1.0
JDG_VERSION=6.2.0
AUTHORS="Christina Lin"
PROJECT="git@github.com:weimeilin79/fuseCamelWorkshop.git"
FUSE=jboss-fuse-6.1.0.redhat-379
FUSE_BIN=jboss-fuse-full-6.1.0.redhat-379.zip
JDG=jboss-datagrid-6.2.0-server
JDG_BIN=jboss-datagrid-6.2.0-server.zip
DEMO_HOME=./target
FUSE_HOME=$DEMO_HOME/$FUSE  
JDG_HOME=$DEMO_HOME/$JDG
FUSE_SERVER_CONF=$FUSE_HOME/etc
JDG_SERVER_CONF=$JDG_HOME/standalone/configuration
FUSE_SERVER_BIN=$FUSE_HOME/bin
SRC_DIR=./installs
PRJ_DIR=./projects/amqp-example-web

# wipe screen.
clear 

# add executeable in installs
chmod +x installs/*.zip


echo
echo "#################################################################"
echo "##                                                             ##"   
echo "##  Setting up the ${DEMO}               ##"
echo "##                                                             ##"   
echo "##                                                             ##"   
echo "##                #####  #   #  #####  #####                   ##"
echo "##                #      #   #  #      #                     	 ##"
echo "##                #####  #   #  #####  ####                    ##"
echo "##                #      #   #      #  #                       ##"
echo "##                #      #####  #####  #####                   ##"
echo "##                                                             ##"   
echo "##                                                             ##"   
echo "##  brought to you by,                                         ##"   
echo "##                    ${AUTHORS}                            ##"
echo "##                                                             ##"   
echo "##  ${PROJECT}           ##"
echo "##                                                             ##"   
echo "#################################################################"
echo

# double check for maven.
command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

# make some checks first before proceeding.	
if [[ -r $SRC_DIR/$FUSE_BIN || -L $SRC_DIR/$FUSE_BIN ]]; then
		echo $DEMO FUSE is present...
		echo
else
		echo Need to download $FUSE_BIN package from the Customer Support Portal 
		echo and place it in the $SRC_DIR directory to proceed...
		echo
		exit
fi

# make some checks first before proceeding.	
if [[ -r $SRC_DIR/$JDG_BIN || -L $SRC_DIR/$JDG_BIN ]]; then
		echo $DEMO JDG is present...
		echo
else
		echo Need to download $JDG_BIN package from the Customer Support Portal 
		echo and place it in the $SRC_DIR directory to proceed...
		echo
		exit
fi



# Create the target directory if it does not already exist.
if [ ! -x $DEMO_HOME ]; then
		echo "  - creating the demo home directory..."
		echo
		mkdir $DEMO_HOME
else
		echo "  - detected demo home directory, moving on..."
		echo
fi


# Move the old JBoss instance, if it exists, to the OLD position.
if [ -x $FUSE_HOME ]; then
		echo "  - existing JBoss FUSE detected..."
		echo
		echo "  - moving existing JBoss FUSE aside..."
		echo
		rm -rf $FUSE_HOME.OLD
		mv $FUSE_HOME $FUSE_HOME.OLD

		# Unzip the JBoss instance.
		echo Unpacking JBoss FUSE $VERSION
		echo
		unzip -q -d $DEMO_HOME $SRC_DIR/$FUSE_BIN
else
		# Unzip the JBoss instance.
		echo Unpacking new JBoss FUSE...
		echo
		unzip -q -d $DEMO_HOME $SRC_DIR/$FUSE_BIN
fi


# Move the old JBoss instance, if it exists, to the OLD position.
if [ -x $JDG_HOME ]; then
		echo "  - existing JBoss JDG detected..."
		echo
		echo "  - moving existing JBoss FUSE aside..."
		echo
		rm -rf $$JDG_HOME.OLD
		mv $$JDG_HOME $$JDG_HOME.OLD

		# Unzip the JBoss instance.
		echo Unpacking JBoss JDG $JDG_VERSION
		echo
		unzip -q -d $DEMO_HOME $SRC_DIR/$JDG_BIN
else
		# Unzip the JBoss instance.
		echo Unpacking new JBoss JDG...
		echo
		unzip -q -d $DEMO_HOME $SRC_DIR/$JDG_BIN
fi

echo "  - enabling demo accounts logins in users.properties file..."
echo
cp support/users.properties $FUSE_SERVER_CONF

echo "  - setup JDG configuration ..."
echo
cp support/standalone.xml $JDG_SERVER_CONF



echo "  - making sure 'FUSE' for server is executable..."
echo
chmod u+x $FUSE_HOME/bin/fuse


echo "  - making sure 'JDG' for server is executable..."
echo
chmod u+x $JDG_HOME/bin/standalone.sh


