require 'logger'

module PayPal::SDK::Core
  # Include Logging module to provide logger functionality.
  # == Configure logger
  #   Logging.logger = Logger.new(STDERR)
  #
  # == Example
  #   include Logger
  #   logger.info "Debug message"
  module Logging

    # Get logger object
    def logger
      @logger ||= Logging.logger
    end

    def log_event(message, start_time, end_time = Time.now)
      duration = sprintf("%.3f", end_time - start_time)
      logger.info "[#{duration}] #{message}"
    end

    class << self

      # Get or Create configured logger based on the default environment configuration
      def logger
        @logger ||= Logger.new(Config.config.logfile || STDERR)
      end

      # Set logger directly and clear the loggers cache.
      # === Attributes
      # * <tt>logger</tt> -- Logger object
      # === Example
      #   Logging.logger = Logger.new(STDERR)
      def logger=(logger)
        @logger  = logger
      end

    end
  end

end

