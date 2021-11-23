require 'spec'
require_relative 'task5.rb'
require 'securerandom'

RSpec.describe 'FileAnalyzer' do

  def get_output
    $stdout.rewind
    $stdout.gets
  end

  let(:file_analyzer) { FileAnalyzer.new }
  let(:text) { SecureRandom.hex }
  file_name = "#{SecureRandom.hex}.txt"
  test_data = SecureRandom.hex
  new_file_name = '#{SecureRandom.hex}.txt'
  invalid_file_name = { empty_string: '',
                        point: '.',
                        less_sign: '<',
                        more_sign: '>',
                        colon: ':',
                        too_long: SecureRandom.hex(261)
  }
  $stdout = StringIO.new

  it 'verify creating new file and write text with w access right' do
    file_analyzer.edit_file(file_name, test_data)
    file = File.open(file_name)
    expect(file.readlines).to eq([test_data])
    expect(File).to exist(file_name)
    expect(File.exist?(file_name)).to be
  end

  it 'verify editing already existing file with a access right' do
    file_analyzer.create_write_file(file_name, text)
    context = file_analyzer.read_file(file_name)
    expect(context).to eq([test_data + text])
  end

  it 'verify replace text in file with w access right' do
    file_analyzer.edit_file(file_name, text)
    file = File.open(file_name)
    expect(file.readlines).to eq([text])
  end

  it 'verify renaming file with valid data' do
    file_analyzer.rename_file(file_name, new_file_name)
    expect(File.exist?(new_file_name)).to be
    expect(File.exist?(file_name)).to be_falsey
  end

  invalid_file_name.each_pair do |key, invalid_name|
  it "verify renaming file with #{key} data impossible" do
    file_analyzer.rename_file(new_file_name, invalid_name)
    expect(get_output).to include('No such file or directory')
   end
  end

  it 'verify deleting exist file' do
    file_analyzer.delete_file(new_file_name)
    expect(File.exist?(new_file_name)).to be false
  end

  it "verify deleting non-exist file is impossible" do
    file_analyzer.delete_file(new_file_name)
    expect(get_output).to include('No such file or directory')
  end

end

