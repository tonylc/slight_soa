ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'fakeweb'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec/rails'

module ControllerSpecHelper
  def self.included(base)
    base.integrate_views
  end

  def stub_services!
    %w(core_service).each do |service_name|
      mock_service = mock(service_name)
      controller.stub("#{service_name}".to_sym => mock_service)

      self.class.send(:delegate, service_name.to_sym, :to => :controller)
    end
  end

  def login_as(user)
    session['user_id'] = user
    calendars_service.stub(:get_tracked_locations => [24426])
    core_service.stub(:get_location => CoreData::Location.new_mock)
  end

  def body
    response.should be_success
    response.body
  end

  # custom matchers
  Spec::Matchers.define :render_404 do
    match do |actual|
      actual.code == "404"
    end
  end
end

Spec::Runner.configure do |config|
  config.include ControllerSpecHelper, :type => :controller

  config.before(:each) do
    FakeWeb.allow_net_connect = false
  end
end
