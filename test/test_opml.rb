require_relative 'minitest_helper'

class TestOPML < Minitest::Test
  describe 'Parser' do
    before do
      file = File.open(File.expand_path('../fixtures/basic.opml', __FILE__), 'r')
      xml = file.read

      @basic_feed = Feedjira::Feed.parse(xml)
    end

    it 'uses the OPML parser' do
      assert_equal Feedjira::Parser::OPML, @basic_feed.class
    end

    describe 'for basic OPML' do
      it 'gets the title when present' do
        assert_equal 'Head Title', @basic_feed.head.title
      end

      it 'handles optional head elements when not present' do
        assert_equal nil, @basic_feed.head.owner_name
      end

      it 'gets the outlines' do
        assert_equal 3, @basic_feed.body.outlines.count
      end

      it 'gets an outline text' do
        assert_equal 'Outline 1 text', @basic_feed.body.outlines.first.text
      end
    end

    describe 'for subscription lists' do
      before do
        file = File.open(File.expand_path('../fixtures/subscription-list.opml', __FILE__), 'r')
        xml = file.read

        @list_feed = Feedjira::Feed.parse(xml)
      end

      it 'gets an outline type' do
        assert_equal 'rss', @list_feed.body.outlines.first.type
      end

      it 'gets an outline XML url' do
        assert_equal 'http://www.example.com/outline/1.rss', @list_feed.body.outlines.first.xml_url
      end
    end
  end
end
