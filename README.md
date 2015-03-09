# HISC Parser

This simple ruby script is intended to allow you to take a csv and split it into multiple csvs based on an id column.

The script assumes that the first column is a numeric id column and excludes anything that does not match this.

# Installation

This is a ruby script so it requires ruby in order to use.

Major dependencies include:

* Git
* Ruby
* Bundler

Ruby can be installed in multiple ways my recommendations are:

* [Ruby for Windows](http://rubyinstaller.org/)
* [Ruby Version Manager for Linux or Mac](https://rvm.io/)

Once installed open a new command window and install [bundler](http://bundler.io/):

`gem install bundler`

# Use

The project assumes that you have a CSV file with your data in it.

The rest is as follows:

* Open a command prompt and navigate to the directory that the HISC Parser exists. Directory should include the Gemfile and the lib directory.
* Install dependencies by typing the following: `bundle install`
* Once complete use the _full source file path_ (including the entire path "/directory/path/to/file/then_file.csv") and the _full destination directory_ and execute the script as follows: `ruby lib\parser.rb full_source_file_path full_destiantion_directory`. [ _Windows users remember to use double \\ for the path for example c:\\directory\\path\\to\\file\\then_file.csv_ ]

# Limitations or Cautions

I have NOT tested the project with files or directories
with spaces so I recommend you don't put spaces.  I also did not TDD this project due to it being a quick one off solution
for a fellow employee.  If I'm going to accept any pull requests or updates I will re-implement the entire thing with TDD.
