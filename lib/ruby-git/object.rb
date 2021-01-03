# rubocop:disable Style/FrozenStringLiteralComment
require 'fileutils'
# rubocop:enable Style/FrozenStringLiteralComment

module RubyGit
  RUBY_GIT_DIRECTORY = "#{Dir.pwd}/.ruby-git".freeze
  OBJECTS_DIRECTORY = "#{RUBY_GIT_DIRECTORY}/objects".freeze

  # Git object representation
  class Object
    def initialize(sha)
      @sha = sha
    end

    def write(&block)
      object_directory = "#{OBJECTS_DIRECTORY}/#{@sha[0..1]}"
      FileUtils.mkdir_p object_directory
      object_path = "#{object_directory}/#{@sha[2..-1]}"
      File.open(object_path, 'w', &block)
    end
  end
end
