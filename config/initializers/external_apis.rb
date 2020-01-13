# frozen_string_literal: true

class ExternalApis
  class << self
    file = ERB.new(File.read(File.join(__dir__, '../external_apis.yml'))).result
    YAML.safe_load(file, aliases: true)[ENV['RAILS_ENV']].each do |service, url|
      define_method(service) do
        url['host']
      end
    end
  end
end

