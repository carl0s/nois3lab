Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  provider :facebook, '167093860459', '50cb57d5a6a469408c0fab22b4a45424', {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
  provider :twitter, 'mCNgrsEAv3tUvm3eEa5RA', 'SdHnT2Wj6NHYoAvnPtgHevCJxeSH8v3lbeIpC7Gcs'
  # If you want to also configure for additional login services, they would be configured here.
  provider :tumblr, 'nqrv0EyDf9lnb7u6TrkPXQCf634FM1UtnYlLxgixrRS9rr5c86', 'dR25RkyxEqBkZV4ryqvkPI9i458kfriCRb7TFLzXsqjq95fjBw'
end

