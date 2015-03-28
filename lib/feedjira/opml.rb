require 'feedjira'

require 'feedjira/opml/version'

require 'feedjira/parser/opml_outline'
require 'feedjira/parser/opml_head'
require 'feedjira/parser/opml_body'
require 'feedjira/parser/opml'

Feedjira::Feed.add_feed_class(Feedjira::Parser::OPML)
