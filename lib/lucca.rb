# frozen_string_literal: true

require 'thor'
require 'thor/version'

module Lucca
  class Error < StandardError; end
end

require 'lucca/cli'
require 'lucca/version'
