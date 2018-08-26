#!/bin/bash

# Get source code
#git clone https://github.com/googlesamples/android-UniversalMusicPlayer.git uamp-java
#cp -r uamp-java uamp-kotlin
#cd uamp-java
#git checkout v1
#cd ..

# File count

echo "Java file count: `find uamp-java/ -name \*.java | wc -l`"
echo "Kotlin file count: `find uamp-kotlin/ -name \*.kt | wc -l`"

# LoC count - Build lloc-1.4.jar and place in root
echo "Java LoC"
java -cp lloc-1.4.jar io.gitlab.arturbosch.LocCounter java uamp-java/

echo "Kotlin LoC"
java -cp lloc-1.4.jar io.gitlab.arturbosch.LocCounter kt uamp-kotlin/

# McCabe Complexity, etc.

# TODO: apply patch
#echo "Kotlin Complexity"
#uamp-kotlin/gradlew detektCheck

# TODO: apply patch

# Class Count

echo "Java class count"
find uamp-java/ -name \*.java | xargs grep -vHsF "*" | grep -HsF "class " | wc -l

echo "Kotlin class count"
find uamp-kotlin/ -name \*.kt | xargs grep -vHsF "*" | grep -HsF "class " | wc -l


