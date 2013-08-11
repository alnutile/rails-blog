class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :path => ":rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :url => ':s3_alias_url',
                    :s3_host_alias => 's3-us-west-2.amazonaws.com/nutilesblog'

  validates_attachment_size :data, :less_than => 100.megabytes
  validates_attachment_presence :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
