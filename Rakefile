
task :default => [:run]

task :run => [:build]


task :build do
  `cp -r ./src ./build`
  `docker build -t williams-project:local .`  
end

task :run do
  `docker run -p 80:80 williams-project:local`
end
