# frozen_string_literal: true

require "minitest/autorun"
require "minitest/focus"
require "minitest/rg"

require "simple_xdg"

class SimpleXDG
  module TestHelper
    def jruby?
      ::RUBY_ENGINE == "jruby"
    end

    def truffleruby?
      ::RUBY_ENGINE == "truffleruby"
    end

    def windows?
      ::RbConfig::CONFIG["host_os"] =~ /mswin|msys|mingw|cygwin|bccwin|wince|emc/
    end

    def allow_fork?
      ::Process.respond_to?(:fork)
    end
  end
end
