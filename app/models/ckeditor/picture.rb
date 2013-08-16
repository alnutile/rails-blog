class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :path => "/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :url => ':s3_alias_url',
                    :s3_host_alias => 's3-us-west-2.amazonaws.com/nutilesblog',
                    :styles => { :content => '800>', :thumb => '118x100#' }

  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_presence :data

  def url_content
    url(:content)
  end
end
