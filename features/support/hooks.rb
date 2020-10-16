require 'faraday'
require 'json'

Around("not @appmap-disable") do |scenario, block|
  begin
    api_url = 'http://localhost:3000/_appmap/record'
    appmap_json = "tmp/appmap/cucumber/%s-remote.appmap.json" % scenario.name.gsub(' ', '_')

    response = Faraday.post api_url
    puts response.status

    appmap = AppMap.record do
      block.call
    end

    # AppMap::Cucumber.write_scenario(scenario, appmap)
  ensure

    response = Faraday.delete api_url
    puts response.status

    File.open(appmap_json, "w+") do |file|
      file.write response.body.force_encoding 'utf-8'
    end
  end
end
