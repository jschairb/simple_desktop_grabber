require 'spec_helper'

module SimpleDesktopGrabber
  describe Parser do
    describe ".download" do
      it "makes a directory" do
        parser = Parser.new("http://simpledesktops.com/browse")
        parser.download
      end
    end

    describe ".images" do
      it "returns a collection" do
        parser = Parser.new("http://simpledesktops.com/browse")
        parser.images.should be_kind_of(Array)
      end
    end

    describe ".pages" do
      it "returns a collection" do
        parser = Parser.new("http://simpledesktops.com/browse")
        parser.pages.should be_kind_of(Array)
      end

      it "includes urls as items" do
        parser = Parser.new("http://simpledesktops.com/browse")
        parser.pages[0].should == "http://simpledesktops.com/browse"
        parser.pages[1].should == "http://simpledesktops.com/browse/2/"
      end
    end
  end
end
