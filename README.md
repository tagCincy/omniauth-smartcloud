# OmniAuth Smartcloud

OmniAuth strategy for authenticating to [IBM's Smartcloud for Social Business](http://www.ibm.com/cloud-computing/social/us/en/).

## Basic Usage

    use OmniAuth::Builder do
      provider :smartcloud, ENV['SMARTCLOUD_KEY'], ENV['SMARTCLOUD_SECRET']
    end

## Dependancy Note

For some reason, IBM has chose to make the content type of the token request response to be 'text/plain' even though
it is a url query string.  Until IBM comes to their senses and changes the content type of the response to
'application/x-www-form-urlencoded', or my pull request is merged, you must include my fork of the [OAuth2
gem](https://github.com/tagCincy/oauth2) in the Gemfile of your project.

    gem 'oauth2', :git => 'git@github.com:tagCincy/oauth2.git'