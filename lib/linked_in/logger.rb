module LinkedIn
  require 'logger'
  require 'forwardable'

  extend Forwardable
  extend self

  def_delegators :logger, :debug, :info, :warn, :error, :fatal, :level, :level=

  attr_accessor :logger
  self.logger = Logger.new(STDOUT)
  logger.level = Logger::ERROR
end
