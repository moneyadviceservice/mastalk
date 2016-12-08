require 'spec_helper'

RSpec.describe 'Integration Tests' do
  subject(:document) { Mastalk::Document.new(content) }

  context 'when parsing duplicated snippets' do
    let(:content) do
      File.read(File.join('spec', 'fixtures', 'duplicated_snippets'))
    end

    let(:expected_result) do
      File.read(
        File.join('spec', 'fixtures', 'expected_conversion_duplicated_snippets')
      )
    end

    it 'converts to html using the snippets' do
      expect(document.to_html).to eq(expected_result)
    end
  end

  context 'when parsing complex document' do
    let(:content) do
      File.read(File.join('spec', 'fixtures', 'complex_document'))
    end

    it 'converts to html using snippers' do
      pending
      expect(document.to_html).to eq('')
    end
  end
end
