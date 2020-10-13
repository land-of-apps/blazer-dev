require "appmap/middleware/remote_recording"

if Rails.env.development?
  Rails.application.config.middleware.insert_after \
    Rails::Rack::Logger,
    AppMap::Middleware::RemoteRecording
end
