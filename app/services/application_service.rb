module Services
  class ServiceException < Exception
    attr_reader :code
    
    def initialize(message, error_code=500)
      super(message)
      @code = error_code
    end
  end
  class ApplicationService
   def self.call(*args, &block)
     new(*args, &block).call
   end
  end
end