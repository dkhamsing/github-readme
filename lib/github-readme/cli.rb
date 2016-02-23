# Command line interface
module GitHubReadme
  require 'github-readme/version'
  require 'github-readme/get'

  class << self
    def cli
      puts "#{PRODUCT} #{VERSION}"

      if ARGV.count == 0
        usage
        exit
      end

      cli_repo = ARGV[0]

      unless cli_repo.include? '/'
        usage
        exit
      end

      repo = cli_repo.sub 'https://github.com/', ''
      r = get repo

      e = r['error']
      unless e.nil?
        puts "Error: #{e}" unless e.nil?
        exit 1
      end

      f = repo.gsub( '/', '-') + '-readme.md'
      puts "Writing #{f} ⚡️"
      File.open(f, 'w') { |f| f.write r['readme'] }
    end

    def usage
      puts "Usage: #{PRODUCT} <GitHub Repo>"
    end
  end
end
