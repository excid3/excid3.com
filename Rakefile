DEPLOY_TO = "192.241.188.190"

module Colors
  def colorize(text, color_code)
    "\033[#{color_code}m#{text}\033[0m"
  end

  {
    :black    => 30,
    :red      => 31,
    :green    => 32,
    :yellow   => 33,
    :blue     => 34,
    :magenta  => 35,
    :cyan     => 36,
    :white    => 37
  }.each do |key, color_code|
    define_method key do |text|
      colorize(text, color_code)
    end
  end
end

task :build do
  include Colors

  puts
  puts yellow("Building HTML...")

  sh "jekyll build"

  puts green("Finished building HTML")
end

task :rsync do
  include Colors

  puts
  puts yellow("Syncing to server...")

  sh "rsync -azvh _site/* deploy@#{DEPLOY_TO}:/home/deploy/excid3.com"

  puts green("Finished uploading to #{DEPLOY_TO}")
end

task all: ["build", "rsync"]
task default: :all
