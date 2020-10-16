require 'faraday'
require 'json'

Around("not @appmap-disable") do |scenario, block|
  begin
    api_url = 'http://localhost:3000/_appmap/record'
    appmap = "tmp/appmap/cucumber/%s-remote.appmap.json" % scenario.name.gsub(' ', '_').downcase

    response = Faraday.post api_url
    puts response.status

    appmap = AppMap.record do
      block.call
    end
    AppMap::Cucumber.write_scenario(scenario, appmap)
  ensure

    response = Faraday.delete api_url
    puts response.status


    # copy/paste this into json file and upload to appland
    # results in valid, full appmaps - but remote recording
    #puts response.body



    # writing to file fails, use `force_encoding` to allow it to write
    # to .txt files. But when writing to json files it results in a
    # `no implicit conversion of Hash into String (TypeError)`

    # change filename to variable appamp to see TypeError
    File.open("tmp/appmap/cucumber/test.txt", "w") do |file|
      file.write response.body.force_encoding 'utf-8'
    end


  end
end
