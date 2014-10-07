#!/usr/bin/env rspec

require 'spec_helper'

describe 'ssh' do
  it { should contain_class 'ssh' }
end
