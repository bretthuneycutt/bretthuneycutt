require 'spec_helper'

describe Place do
  let(:data) { YAML.load_file("./data/places.yml") }
  subject { Place.new(data.first) }

  its(:name) { should == "Phoenix" }
  its(:lat) { should == 33.448377 }
  its(:long) { should == -112.074037 }
  its(:color) { should == "green" }
end
