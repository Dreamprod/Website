
task :default => [:run]

task :run => [:clean, :build]


task :build do
  puts "build"
  `cp -r src/ build/`
  `docker build -t williams-project:local .`  
end

task :run do
  puts "Site is running on localhost:80"
  `docker run -p 80:80 williams-project:local`
end

task :clean do 
  `rm -fr build`
end
