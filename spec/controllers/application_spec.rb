require 'spec_helper'

describe ApplicationController do
  %w(core_service).each do |service|
    it "should have service #{service}" do
      klass = service.to_s.split("_").map(&:capitalize).join("")
      @controller.send(service).is_a?(klass.constantize).should be_true
    end
  end
end
