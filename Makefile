build: bootstrap draw imageexport tomcat

bootstrap:
	mkdir webapps

tomcat:
	curl -o apache-tomcat-7.0.34.tar.gz -q http://mirror3.layerjet.com/apache/tomcat/tomcat-7/v7.0.34/bin/apache-tomcat-7.0.34.tar.gz
	tar -xzpf apache-tomcat-7.0.34.tar.gz

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
