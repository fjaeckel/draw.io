TOMCAT_VERSION="7.0.34"

build: bootstrap draw imageexport tomcat

bootstrap:
	mkdir webapps bin lib logs work conf temp

tomcat:
	curl -o apache-tomcat-${TOMCAT_VERSION}.tar.gz -q http://mirror3.layerjet.com/apache/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
	tar -xzpf apache-tomcat-${TOMCAT_VERSION}.tar.gz
	for i in catalina.sh configtest.sh daemon.sh digest.sh setclasspath.sh shutdown.sh startup.sh tomcat-* tool-wrapper.sh version.sh commons-daemon* bootstrap.jar catalina-tasks.xml; do mv apache-tomcat-${TOMCAT_VERSION}/bin/$$i bin/; done;
	mv apache-tomcat-${TOMCAT_VERSION}/lib/* lib/;
	mv apache-tomcat-${TOMCAT_VERSION}/conf/* conf/;
	rm -rf apache-tomcat-${TOMCAT_VERSION}*

draw:
	cd war && jar cf draw.war .
	mv war/draw.war webapps/

imageexport:
	cd etc/imageexport && ant
	mv etc/imageexport/ImageExport.war webapps/
	rm -rf etc war src

clean:
	git clean -x -d -f
	git checkout -- war src etc
