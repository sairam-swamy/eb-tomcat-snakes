# cd src
# mkdir -p WEB-INF/classes
# echo .
# javac -d WEB-INF/classes com/snakes/model/Media.java
# echo .
# javac -classpath WEB-INF/lib/*:WEB-INF/classes -d WEB-INF/classes com/snakes/model/Movie.java
# echo .
# javac -classpath WEB-INF/lib/*:WEB-INF/classes -d WEB-INF/classes com/snakes/web/ListMovies.java
# echo .
# javac -classpath WEB-INF/lib/*:WEB-INF/classes -d WEB-INF/classes com/snakes/web/AddMovie.java
# echo .
# javac -classpath WEB-INF/lib/*:WEB-INF/classes -d WEB-INF/classes com/snakes/web/SearchMovies.java
# echo .
# if [ -d ".ebextensions/httpd/conf.d" ]; then
#   jar -cf ROOT.war *.jsp images css js WEB-INF .ebextensions/*.config .ebextensions/*.json .ebextensions/httpd/conf.d/*.conf
# else
#   jar -cf ROOT.war *.jsp images css js WEB-INF .ebextensions/*.config .ebextensions/*.json
# fi
# echo .
# if [ -d "/Library/Tomcat/webapps" ]; then
#   cp ROOT.war /Library/Tomcat/webapps
#   echo .
# fi
# mv ROOT.war ../
# echo .
# echo "SUCCESS"

cd src
mkdir -p WEB-INF/classes
mkdir -p WEB-INF/lib

# Download missing log4j-core JAR if it doesn't exist
LOG4J_VERSION="2.20.0" # Change this to match your existing log4j-api version if needed
if [ ! -f "WEB-INF/lib/log4j-core-${LOG4J_VERSION}.jar" ]; then
    echo "Downloading log4j-core dependency..."
    curl -sS -o WEB-INF/lib/log4j-core-${LOG4J_VERSION}.jar \
      "https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-core/${LOG4J_VERSION}/log4j-core-${LOG4J_VERSION}.jar"
fi

echo .
javac -d WEB-INF/classes com/snakes/model/Media.java
echo .
javac -classpath "WEB-INF/lib/*:WEB-INF/classes" -d WEB-INF/classes com/snakes/model/Movie.java
echo .
javac -classpath "WEB-INF/lib/*:WEB-INF/classes" -d WEB-INF/classes com/snakes/web/ListMovies.java
echo .
javac -classpath "WEB-INF/lib/*:WEB-INF/classes" -d WEB-INF/classes com/snakes/web/AddMovie.java
echo .
javac -classpath "WEB-INF/lib/*:WEB-INF/classes" -d WEB-INF/classes com/snakes/web/SearchMovies.java
echo .
if [ -d ".ebextensions/httpd/conf.d" ]; then
  jar -cf ROOT.war *.jsp images css js WEB-INF .ebextensions/*.config .ebextensions/*.json .ebextensions/httpd/conf.d/*.conf
else
  jar -cf ROOT.war *.jsp images css js WEB-INF .ebextensions/*.config .ebextensions/*.json
fi
echo .
if [ -d "/Library/Tomcat/webapps" ]; then
  cp ROOT.war /Library/Tomcat/webapps
  echo .
fi
mv ROOT.war ../
echo .
echo "SUCCESS"
