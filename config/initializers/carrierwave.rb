CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region:                'ap-northeast-1',
      path_style:            true
    }

    config.fog_public     = true
    config.fog_attributes = { 'Cache-Control' => 'public, max-age=86400' }

    config.fog_directory = 'hanaguri-silver'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/hanaguri-silver'
  end
end
