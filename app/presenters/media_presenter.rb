class MediaPresenter < BasePresenter
  attr_reader :media, :file

  def initialize(media)
    @media = media
    @file = media.file
  end

  def present
    notice_presenting

    {
      name: media.name,
      file: present_file
    }
  end

  private

  def notice_presenting
    media.increment!(:present_count) # rubocop:disable Rails/SkipsModelValidations
  end

  def present_file
    {
      url: file.service_url,
      name: file.filename,
      size: file.blob.byte_size,
      content_type: file.blob.content_type
    }
  end
end
