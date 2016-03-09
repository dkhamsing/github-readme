require 'github-readme'
require 'pp'

describe GitHubReadme do
  describe "get" do
    repo = 'dkhamsing/github-readme'
    context "given the repo #{repo} " do
      r = GitHubReadme::get repo
      pp r

      expected = 'README.md'
      value = r['name']
      it "the README name is README.md" do
        expect(value).to eql(expected).or(eql(nil))
      end

      value1 = r['readme']
      expected1 = 'Writing dkhamsing-awesome_bot-readme.md'
      it "the content is retrieved" do
        expect(value1).to include(expected1).or(eql(nil))
      end

      expected2 = 'Get the README from a GitHub repository :octocat:'
      value2 = r['summary']
      it "the summary is parsed" do
        expect(value2).to eql(expected2).or(eql(nil))
      end

      e = r['error']
      if e.to_s.include? 'rate limit'
        expected3 = nil
        value3 = r['name']
        it "the README name is nil when there is an error" do
          expect(value3).to eql(expected3)
        end
      end
    end
  end
end
