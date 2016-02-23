# github-readme

Get the README from a GitHub repository :octocat:

## Installation

```shell
$ gem install github-readme --pre
```

## Usage

### Command Line

```shell
$ github-readme dkhamsing/awesome_bot
Gettin README for dkhamsing/awesome_bot ...
Writing dkhamsing-awesome_bot-readme.md
```

### Library

```shell
$ irb
irb(main):001:0> require 'github-readme'
=> true
irb(main):002:0> GitHubReadme::get 'postmates/PMJSON'
=> {=> {"name"=>"README.md", "readme"=>"# PMJSON\n\n[![Version](https://...", "summary"=>"PMJSON provides a pure-Swift strongly-typed JSON encoder/decoder as well as a set of convenience methods for converting to/from Foundation objects and for decoding JSON structures.", "error"=>nil}
```

## Contact

- [github.com/dkhamsing](https://github.com/dkhamsing)
- [twitter.com/dkhamsing](https://twitter.com/dkhamsing)

## License

This project is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
