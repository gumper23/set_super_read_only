#!/usr/bin/env ruby

require 'mysql2'

begin

    client = Mysql2::Client.new(host: "127.0.0.1", port: "13306", username: ENV["MYSQL_USERNAME"], password: ENV["MYSQL_PASSWORD"])

    client.query("set global read_only=ON, super_read_only=ON")

rescue Mysql2::error => e
    puts e.errno
    puts e.error

ensure
    client.close if client

end

