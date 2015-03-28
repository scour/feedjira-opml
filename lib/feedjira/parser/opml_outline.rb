module Feedjira
  module Parser
    class OPMLOutline
      include SAXMachine
      include FeedUtilities

      attribute :type
      attribute :text

      attribute :xmlUrl, as: :xml_url do |s|
        URI(s)
      end

      attribute :isComment, as: :is_comment
      attribute :isBreakpoint, as: :is_breakpoint

      attribute :created do |s|
        Time.parse(s)
      end

      attribute :category
      attribute :description

      attribute :htmlUrl, as: :html_url do |s|
        URI(s)
      end

      attribute :language
      attribute :title
      attribute :version

      attribute :url do |s|
        URI(s)
      end

      def comment?
        !!is_comment && is_comment == 'true'
      end

      def breakpoint?
        !!is_breakpoint && is_breakpoint == 'true'
      end
    end
  end
end
