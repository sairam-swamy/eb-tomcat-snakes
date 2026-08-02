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

# Ensure any duplicate or old log4j-core versions are removed
rm -f WEB-INF/lib/log4j-core-2.20.0.jar

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
