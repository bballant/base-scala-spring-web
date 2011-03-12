BUILD_NAME="avec-lemap"
describe = "avec-lemap -- run rake test"

BASE_SRC='src/main'
BASE_TEST_SRC='src/test'
SCALA_SRC="#{BASE_SRC}/scala"
SCALA_TEST_SRC="#{BASE_TEST_SRC}/scala"
JAVA_SRC="#{BASE_SRC}/java"
JAVA_TEST_SRC="#{BASE_TEST_SRC}/java"
RESOURCES_DIR="#{BASE_SRC}/resources"
TARGET_DIR='target'
TARGET_CLASSES_DIR="#{TARGET_DIR}/classes"
TARGET_TEST_CLASSES_DIR="#{TARGET_DIR}/test_classes"
TARGET_JAR="#{TARGET_DIR}/#{BUILD_NAME}.jar"

LIB_DIR='lib'
LIB_DEFAULT="#{LIB_DIR}/default"
LIB_TEST="#{LIB_DIR}/test"
LIB_TOOL="#{LIB_DIR}/tool"

def compile_classpath
  [Dir.glob("#{LIB_DEFAULT}/*.jar")].flatten.join(':')
end

def compile_test_classpath
  test_path = [Dir.glob("#{LIB_TEST}/*.jar"), TARGET_CLASSES_DIR].flatten.join(':')
  "#{compile_classpath}:#{test_path}"
end

def compile_scala(src_dirs, classpath, target_dir)
  #comp_switches = "-deprecation -explaintypes -Xprint-types"
  comp_switches = "-deprecation"
  sh "find #{src_dirs.select{|d| File.exist?(d)}.join(' ')} -name '*.scala' -or -name '*.java' | xargs fsc -classpath #{classpath} -d #{target_dir} #{comp_switches}"
end

def compile_java(src_dir, classpath, target_dir)
  if File.exist?(src_dir)
    comp_switches = ""
    sh "find #{src_dir} -name '*.java' | xargs javac -classpath #{classpath} -d #{target_dir} #{comp_switches}"
  end
end

def copy_resources(resources_dir, target_dir) 
  if File.exist?(resources_dir)
    sh "cp -a #{resources_dir}/* #{target_dir}"
  end
end

def fetch_external_jars
  sh "bin/bivy -retrieve 'lib/[conf]/[artifact]-[revision].[ext]' -confs default test tool -types jar bundle"
end

def run_classpath
  [Dir.glob("#{LIB_DEFAULT}/*.jar"), 'target/classes', 'config'].flatten.join(':')
end

def run_test_classpath
  "#{run_classpath}:#{TARGET_TEST_CLASSES_DIR}"
end

task :default => :compile do
  puts "#{describe}"
end

desc "clean compiled classes"
task :clean do
  sh "rm -rf #{TARGET_DIR}"
end

desc "removes everything not tracked by git, careful"
task :nuke do
	puts("attempting to kill fsc")
  system('fsc -shutdown >/dev/null 2>&1') # try it, ignore errs, this is just in case, to clear as much state as possible
	puts("if you really wanna remove all the non git stuff, run 'git clean -fdx .'")
  #sh 'git clean -fdx .'
end

desc "downloads and installs required jars from ivy/maven2 repos"
task :resolve do
  fetch_external_jars
end

desc "compile code"
task :compile => [:clean] do
  fetch_external_jars if not File.directory?('lib') # conditional to speed up quick compile runs
  sh "mkdir -pv #{TARGET_CLASSES_DIR}"
  compile_scala([JAVA_SRC, SCALA_SRC], compile_classpath, TARGET_CLASSES_DIR)
  compile_java(JAVA_SRC, "#{compile_classpath}:#{TARGET_CLASSES_DIR}", TARGET_CLASSES_DIR)
  copy_resources(RESOURCES_DIR, TARGET_CLASSES_DIR)
end

desc "compile test code"
task :compile_test => [:compile] do # only scala tests are supported for now
  sh "mkdir -pv #{TARGET_TEST_CLASSES_DIR}"
  compile_scala([JAVA_TEST_SRC, SCALA_TEST_SRC], compile_test_classpath, TARGET_TEST_CLASSES_DIR)
  compile_java(JAVA_TEST_SRC, "#{compile_test_classpath}:#{TARGET_TEST_CLASSES_DIR}", TARGET_TEST_CLASSES_DIR)
end

desc "scala interactive shell"
task :console do
  sh "scala -cp  #{compile_test_classpath}:#{TARGET_TEST_CLASSES_DIR} -Dbb.env=test -Dlog4j.configuration=file:config/log4j_test.properties"
end

desc "run unit tests"
task :test => [:compile_test] do
  sh "java -classpath #{compile_test_classpath}:#{TARGET_TEST_CLASSES_DIR} -Dgala.env=test -Dlog4j.configuration=file:config/log4j_test.properties org.scalatest.tools.Runner -o -p #{TARGET_TEST_CLASSES_DIR}"
end

desc "jars up compiled code"
task :jar => [:compile] do
  sh "jar cvf #{TARGET_JAR} -C #{TARGET_CLASSES_DIR}/ ."
end
