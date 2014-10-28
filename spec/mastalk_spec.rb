require 'spec_helper'

describe Mastalk::Document do

  context 'Without mastalk syntax' do
    let(:context) { "###test\nwith other stuff" }
    let(:expected) { "<h3 id=\"test\">test</h3>\n<p>with other stuff</p>\n" }

    subject { Mastalk::Document.new(context).to_html }

    it 'kramdown behaviour with no tags' do
      expect(Mastalk::Document.new('test').to_html).to eq("<p>test</p>\n")
    end

    it 'converts to html' do
      expect(subject).to eq(expected)
    end

    context 'multiline' do
      let(:expected) { "<h3 id=\"test\">TEST</h3>\n\n<p>with other stuff</p>\n\n" }
      let(:context) { "### TEST\r\n\r\nwith other stuff\r\n\r\n " }

      it 'converts to html' do
        expect(subject).to eq(expected)
      end
    end
  end

  subject { Mastalk::Document.new(source) }

  let(:expected) { "<div class=\"test\">test</div>\n" }

  context 'custom extension' do
    let(:source) { '$Etest$E' }

    it 'pre-processes custom tags' do
      subject.extension('$E') { |body| "<div class='test'>#{body}</div>" }
      expect(subject.to_html).to eq(expected)
    end

    context 'multi line' do
      let(:source) { '$Etest$E$Shello$FIN' }
      let(:expected) { "<div class=\"test\">test</div>\n<div class=\"test2\">hello</div>\n" }

      it 'processes multi line' do
        subject.extension('$E') { |body| "<div class='test'>#{body}</div>" }
        subject.extension('$S', '$FIN') { |body| "<div class='test2'>#{body}</div>" }
        expect(subject.to_html).to eq(expected)
      end
    end
  end

  context 'extension with start and stop' do
    let(:source) { '$STARTtest$END' }

    it 'pre-processes custom tags' do
      subject.extension('$START', '$END') { |body| "<div class='test'>#{body}</div>" }
      expect(subject.to_html).to eq(expected)
    end
  end

  context 'extension with other extensions inside' do
    let(:source) { "$why\n###header\nbody\n$why" }

    let(:expected) { "<div class=\"why\">\n  <h3 id=\"header\">header</h3>\n<p>body</p>\n\n</div>\n\n" }

    it 'parses nested structures' do
      expect(subject.to_html).to eq(expected)
    end
  end

  context 'with newline as end' do
    let(:source) { "$yes-no\n [y] yes\n [n] no\n $end $why\n###header\nbody\n$why" }

    let(:expected) do
      "<ul class=\"yes-no\">\n  \n<li class=\"yes\">yes</li>\n<li class=\"no\">no</li>\n\n\n</ul>\n<div class=\"why\">
  <h3 id=\"header\">header</h3>\n<p>body</p>\n\n</div>\n\n"
    end

    it 'pre-processes custom tags' do
      expect(subject.to_html).to eq(expected)
    end
  end

end
