require 'spec_helper'

describe ApplicationHelper do
  it "should assign @js to new javascript files" do
    helper.add_to_js('test')
    assigns[:js].should == ['test']
  end

  it "should assign @css new stylesheet files" do
    helper.add_to_css('test')
    assigns[:css].should == ['test']
  end
end
