class PhotoArray < Virtus::Attribute
  primitive Array

  def coerce(value)
    if value.is_a?(Hash)
      super(Telegrammer::DataTypes::PhotoSize.new(value))
    else
      super
    end
  end
end
