require 'spec_helper'
require_relative '../mdtoc'

describe ToCWriter do
  it 'test case #1' do
    expected = File.read('spec/fixtures/test_case_1/TOC.md')
    expect {
      ToCWriter.new('spec/fixtures/test_case_1/SOURCE.md').write
    }.to output(expected).to_stdout
  end

  it 'test case #2' do
    expected = File.read('spec/fixtures/test_case_2/TOC.md')
    expect {
      ToCWriter.new('spec/fixtures/test_case_2/SOURCE.md').write
    }.to output(expected).to_stdout
  end

  it 'test case #3 - use TOP feature' do
    expected = File.read('spec/fixtures/test_case_3/TOC.md')
    expect {
      ToCWriter.new('spec/fixtures/test_case_3/SOURCE.md', 1).write
    }.to output(expected).to_stdout
  end

  it 'test case #4 - use TOP and MAX feature' do
    expected = File.read('spec/fixtures/test_case_4/TOC.md')
    expect {
      ToCWriter.new('spec/fixtures/test_case_4/SOURCE.md', 2, 2).write
    }.to output(expected).to_stdout
  end
end
