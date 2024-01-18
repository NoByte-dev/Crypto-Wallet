class Breadcrumb
  attr_reader :label, :path

  def initialize(label, path)
    @label = label
    @path = path
  end

  def link?
    @path.present?
  end
end
