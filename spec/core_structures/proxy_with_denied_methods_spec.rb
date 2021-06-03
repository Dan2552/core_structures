describe CoreStructures::ProxyWithDeniedMethods do
  let(:object) { [1, 2] }
  let(:denied_methods) { [:<<] }
  let(:described_instance) { described_class.new(object, denied_methods) }

  it "responds to methods the object would normally" do
    expect(described_instance.respond_to?(:count)).to eq(true)
    expect(described_instance.count).to eq(2)
  end

  it "works with mutating methods to change the original object" do
    expect(described_instance.respond_to?(:delete)).to eq(true)
    expect(described_instance.delete(1)).to eq(1)
    expect(object).to eq([2])
  end

  it "blocks methods that are in the denied list" do
    expect { described_instance << 3 }
      .to raise_error("Method << denied by ProxyWithDeniedMethods")
  end

  context "with an object that has private methods" do
    let(:object) { CoreStructures::BinarySortInsertArray.new([]) }

    it "doesn't make those private methods public" do
      begin
        object.store
      rescue NoMethodError
        # Only expect if the original object's method raises the error; mruby
        # doesn't actually have `private` methods, it's simply a no-op.
        expect { described_instance.store }
          .to raise_error(NoMethodError)
      end
    end
  end
end
