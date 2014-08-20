BOOTSTRAP_SOURCE = File.expand_path("./bootstrap")
LESS_MAIN_FILE = './styles/reactivex.less'

task :bootstrap => [:bootstrap_js, :bootstrap_css]

task :bootstrap_js do
  require 'uglifier'

  File.delete("js/bootstrap.min.js")

  # Minifies each javascript subscript
  paths = []
  minifier = Uglifier.new
  Dir.glob(File.join(BOOTSTRAP_SOURCE, 'js', '*.js')).each do |source|
    base = File.basename(source).sub(/^(.*)\.js$/, '\1.bootstrap.min.js')
    paths << base
    target = File.join('js', base)
    if different?(source, target)
      File.open(target, 'w') do |out|
        out.write minifier.compile(File.read(source))
      end
    end
  end

  # Concatenates all javascript subscripts
  out = ""
  Dir['js/*.bootstrap.min.js'].each do |file|
    out += File.read(file)
    out += "\n"
  end
  File.open("js/bootstrap.min.js", 'a') { |file|
    file.write(out)
  }

  # Deletes all javascripts subscripts
  Dir.glob(File.join('js', '*.bootstrap.min.js')).each do |source|
    File.delete(source)
  end
end

task :bootstrap_css do |t|
  puts "Compiling #{LESS_MAIN_FILE}"
  sh 'lessc', '--compress', LESS_MAIN_FILE, 'css/bootstrap.min.css'
end

task :default => :jekyll

task :jekyll => :bootstrap do
  sh 'jekyll serve --watch'
end

def different?(path1, path2)
  require 'digest/md5'
  different = false
  if File.exist?(path1) && File.exist?(path2)
    path1_md5 = Digest::MD5.hexdigest(File.read path1)
    path2_md5 = Digest::MD5.hexdigest(File.read path2)
    (path2_md5 != path1_md5)
  else
    true
  end
end