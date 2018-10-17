#!/bin/bash
javac $1.java
if javac $1.java; then
    java $1
    java -jar checkstyle-8.13-all.jar -c google_checks.xml $1.java > output.txt
    if grep -q "[WARN]" output.txt; then
        echo "We've got issues"
    else
        echo "We have no issues"
    fi
else
    echo "Build fails!"
fi
