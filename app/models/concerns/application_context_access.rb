module ApplicationContextAccess
  extend ActiveSupport::Concern

  class_methods do
    attr_reader :context_key

    def define_context_access(context_key)
      @context_key = context_key
    end

    def current=(instance)
      ApplicationContext[context_key] = instance
    end

    def current
      ApplicationContext[context_key]
    end
  end
end
