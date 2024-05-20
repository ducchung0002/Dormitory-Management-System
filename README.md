### Run by IntelliJ

### Run by command line

#### windows

1. Environment Variables -> System variables -> New <br>
  Variable name = CATALINA_HOME <br>
  Variable value = `path_to_tom_cat_server` <br>
  Variable name = JAVA_HOME <br>
  Variable value = `path_to_jdk` <br>
2. Navigate to your project directory using the command line.
3. Build your project with Maven. This will create a .war file in the target directory of your project.
  <code>mvn.cmd clean install</code>
4. Copy the .war file to the webapps directory of your Tomcat installation. <br>
`cp target/QuanLyKTX-1.0-SNAPSHOT.war $CATALINA_HOME/webapps/`
5. Start the Tomcat server. <br>
 `CATALINA_HOME/bin/startup.bat` <br>
Now, your application should be running on Tomcat server. You can access it by opening a web browser and navigating to <br>
`localhost:8080/QuanLyKTX-1.0-SNAPSHOT/login.jsp`
