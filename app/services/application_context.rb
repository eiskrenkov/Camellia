class ApplicationContext
  CONTEXT_KEY = :application_context

  class << self
    def clear
      Thread.current[CONTEXT_KEY] = nil
    end

    def [](key)
      data[key]
    end

    def []=(key, value)
      data[key] = value
    end

    private

    def data
      Thread.current[CONTEXT_KEY] ||= {}
    end
  end
end
