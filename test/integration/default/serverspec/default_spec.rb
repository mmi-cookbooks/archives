# encoding: UTF-8
# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe file('/tmp/hello.txt') do
  it { should be_file }
end
