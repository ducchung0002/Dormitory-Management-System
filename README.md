#Run by IntelliJ
#Run by command line
##windows
Environment Variables -> System variables -> New
  Variable name = CATALINA_HOME
  Variable value = /path_to_tom_cat_server
  Variable name = JAVA_HOME
  Variable value = /path_to_jdk
  1. Navigate to your project directory using the command line.
  2. Build your project with Maven. This will create a .war file in the target directory of your project.
- mvn.cmd clean install
  3. Copy the .war file to the webapps directory of your Tomcat installation.
- cp target/QuanLyKTX-1.0-SNAPSHOT.war $CATALINA_HOME/webapps/
  4. Start the Tomcat server.
- CATALINA_HOME/bin/startup.bat
Now, your application should be running on Tomcat server. You can access it by opening a web browser and navigating to http://localhost:8080/QuanLyKTX-1.0-SNAPSHOT/login.jsp
