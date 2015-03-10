require 'main'
require 'csv'


module OS
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
    (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OS.unix?
    !OS.windows?
  end

  def OS.linux?
    OS.unix? and not OS.mac?
  end
end

Main {
  argument('source_file_path') {
    description "The full path of the source csv file"
  }
  argument('destination_dir') {
    description "The directory to put the produced csv files"
  }
  def run
    multimap = Hash.new{ | h, k| h[k] = [] }
    options = {}
    options[:encoding] = 'windows-1251:utf-8' if OS.windows?
    CSV.foreach(params['source_file_path'].value, options) do | row |
      (multimap[row.shift] <<  row.join(',')) if (/^(?<num>\d+)$/ =~ row[0])
    end

    FileUtils.mkdir_p params['destination_dir'].value
    keys = multimap.keys.to_set

    keys.each do | key |
      file_name = File.join params['destination_dir'].value, key+".csv"
      File.open(file_name, "a") do | f |
        multimap[key].each do | row |
          f.write row+"\n"
        end
      end
    end
  end
}
