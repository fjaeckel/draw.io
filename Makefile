build: draw imageexport tomcat

tomcat:
	curl -o apache-tomcat-7.0.34.tar.gz -q http://mirror3.layerjet.com/apache/tomcat/tomcat-7/v7.0.34/bin/apache-tomcat-7.0.34.tar.gz
	tar -xzpf apache-tomcat-7.0.34.tar.gz

draw:
	cd war/
	jar cf ../draw.war .

imageexport:
	cd etc/imageexport && ant

clean:
	git clean -x -d -f
