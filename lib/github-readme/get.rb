# Get the README
module GitHubReadme
  require 'octokit'

  class << self
    def client
      Octokit
    end

    def get(repo, client_input = nil)
      cl =
        if client_input.nil?
          client
        else
          client_input
        end

      github cl, repo
    end

    def github(client, repo)
      begin
        r = client.readme repo
      rescue => e
        # puts "Error: #{e}"
        return {
          'name' => nil,
          'readme' => nil,
          'summary' => nil,
          'error' => e
        }
      end

      name = r['name']

      content = r['content']
      if content.nil? || content == ''
        readme = nil
        summary = nil
        error = "No README"
      else
        readme = Base64.decode64 content unless content.nil?
        summary = summarize readme
        error = nil
      end

      {
        'name' => name,
        'readme' => readme,
        'summary' => summary,
        'error' => error
      }
    end

    def summarize(readme, number_of_lines = 1)
       return nil if readme.nil?

       separator = "\n"
       lines = readme.split separator
       d = []
       lines[1..-1].each do |l|
         unless (l.include? '==') || (l.include? '[') || (l.include? '#') || (l.include? '<')
           d.push l if l.length > 0
         end
         break if d.count == number_of_lines
       end

       d.join separator
    end

  end
end
