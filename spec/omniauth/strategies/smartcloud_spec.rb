require 'spec_helper'

describe OmniAuth::Strategies::Smartcloud do
  subject do
    OmniAuth::Strategies::Smartcloud.new({})
  end

  context "client options" do
    it 'should have correct site' do
      subject.options.client_options.site.should eq("https://apps.lotuslive.com")
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://apps.lotuslive.com/manage/oauth2/authorize')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('https://apps.lotuslive.com/manage/oauth2/token')
    end
  end


end
