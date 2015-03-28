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

      it 'gets the vert scroll state as a Numeric' do
        assert @basic_feed.head.vert_scroll_state.is_a?(Numeric)
      end

      it 'gets the vert scroll state' do
        assert_equal 42, @basic_feed.head.vert_scroll_state
      end

      it 'gets the date created as a Time' do
        assert_equal Time, @basic_feed.head.date_created.class
      end

      it 'gets the date created correctly' do
        time = Time.new(2005, 6, 18, 12, 11, 52, '+00:00')

        assert_equal time, @basic_feed.head.date_created
      end

      it 'gets the expansion state as an Array' do
        assert @basic_feed.head.expansion_state.is_a?(Array)
      end

      it 'gets the expansion state with members' do
        assert_equal 6, @basic_feed.head.expansion_state.size
      end

      it 'gets expansion state members as numbers' do
        assert_equal 15, @basic_feed.head.expansion_state.last
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

      it 'handles isComment correctly when present' do
        assert @basic_feed.body.outlines.first.comment?
      end

      it 'handles isBreakpoint correctly when not present' do
        assert_equal false, @basic_feed.body.outlines.first.breakpoint?
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
        url = 'http://www.example.com/outline/1.rss'
        uri = URI(url)

        assert_equal uri, @list_feed.body.outlines.first.xml_url
      end
    end
  end
end
