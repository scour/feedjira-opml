# Feedjira::Opml

[![Gem Version](http://img.shields.io/gem/v/feedjira-opml.svg)](https://rubygems.org/gems/feedjira-opml)
[![Dependency Status](https://gemnasium.com/scour/feedjira-opml.svg)](https://gemnasium.com/scour/feedjira-opml)
[![Build Status](https://travis-ci.org/scour/feedjira-opml.svg)](https://travis-ci.org/scour/feedjira-opml)
[![Code Climate](https://codeclimate.com/github/scour/feedjira-opml/badges/gpa.svg)](https://codeclimate.com/github/scour/feedjira-opml)
[![Coverage Status](https://coveralls.io/repos/scour/feedjira-opml/badge.svg?branch=master&service=github)](https://coveralls.io/github/scour/feedjira-opml?branch=master)

This gem registers a new parser with [Feedjira](http://feedjira.com/) which provides basic support for OPML files. It is based on OPML version 2.0, but does not currently support all aspects of the specification (directories, for example, are not supported).

Beyond what is provided by [Feedjira](https://github.com/feedjira/feedjira), there is no support for converting OPML files to hashes, or generating valid OPML from other data sources.

## Usage

Since **feedjira-opml** automatically registers its OPML parser with Feedjira, using the standard processing methods should generally yield the desired results.

```ruby
Feedjira::Feed.parse(string_of_xml)
```

The OPML parser will match on `/\<opml/`, so it won't conflict with `RSS`, `Atom`, or other native Feedjira parsers.

If its necessary to use the OPML parser explicitly:

```ruby
Feedjira::Feed.parse_with(Feedjira::Parser::OPML, string_of_xml)
```

### Output

All elements and attributes are typecast based on the OPML specification. The behavior for handling values that don't adhere to the spec is undefined.

```ruby
@opml.head.title
@opml.head.owner_name
@opml.head.date_created # Returns a Time
@opml.head.expansion_state # Returns an Array
```

Working with outlines is similar.

```ruby
outline = @opml.body.outlines.first

url = outline.xml_url # Returns a URI
```

The `isComment` and `isBreakpoint` attributes are converted to booleans and accessed through convenience methods.

```ruby
is_comment = outline.comment?
```

There are certain situations where the spec requires certain values meet some criteria based on other values, (e.g. _"An outline element whose type is link must have a url attribute whose value is an http address."_). These requirements are not currently enforced by the parser.
