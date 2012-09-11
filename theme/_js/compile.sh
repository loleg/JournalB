echo Compiling scripts - run from _js folder
SRCLIST="library.js community.js faves.js general.js swipe.js slider.js tabs.js"
java -jar /Users/oleg/localdev/java/compiler-latest/compiler.jar --js $SRCLIST --js_output_file all.min.js
# java -jar /Users/oleg/localdev/java/compiler-latest/compiler.jar --compilation_level WHITESPACE_ONLY --formatting PRETTY_PRINT --js $SRCLIST --js_output_file all_dev.js