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

# Ensure servlet-api and container JARs are NOT packaged inside WEB-INF/lib
rm -f WEB-INF/lib/servlet-api.jar
rm -f WEB-INF/lib/jsp-api.jar
rm -f WEB-INF/lib/jasper.jar

echo .
javac -classpath "WEB-INF/lib/*:WEB-INF/classes" -d WEB-INF/classes com/snakes/model/Media.java
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
