require 'packetfu'
include PacketFu

count = 0
stream = PacketFu::Capture.new(:start => true, :iface => "eth0", :promisc => true)
stream.stream.each do |p|
  packet = PacketFu::Packet.parse p
  if packet.is_ip?
    if packet.is_tcp?
      if packet.tcp_flags.to_i == 0
        puts count.to_s + ". ALERT: Null Scan is detected from " + packet.ip_saddr.to_s + " (UDP)!"
	count += 1
      elsif packet.tcp_flags.to_i == 41
        puts count.to_s + ". ALERT: Xmas Scan is detected from " + packet.ip_saddr.to_s + " (UDP)!"
	count += 1
      else
        if packet.payload.match("Nmap")
          puts count.to_s + ". ALERT: Nmap Scan is detected from " + packet.ip_saddr.to_s + " (UDP)!"
	  count += 1
	end
      end
      if packet.payload.match ("<script>" or "POST" or "GET")
	puts count.to_s + ". ALERT: Cross Site Scripting is detected from " + packet.ip_saddr.to_s + " (HTML)!"
	count += 1
      end
      if packet.payload.match("PASS")
        puts count.to_s + ". ALERT: Password leaked from " + packet.ip_saddr.to_s + " (HTML)!"
        count += 1
      end
      if packet.payload.match /4\d{3}(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}/
	puts count.to_s + ". ALERT: Credit Card leaked in the clear from " + packet.ip_saddr.to_s + " (HTML)!"
	count += 1
      end
      if packet.payload.match /5\d{3}(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}/
	puts count.to_s + ". ALERT: Credit Card leaked in the clear from " + packet.ip_saddr.to_s + " (HTML)!"
	count += 1
      end
      if packet.payload.match /6011(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}/
        puts count.to_s + ". ALERT: Credit Card leaked in the clear from " + packet.ip_saddr.to_s + " (HTML)!"
	count += 1
      end
      if packet.payload.match (/3\d{3}(\s|-)?\d{6}(\s|-)?\d{5}/)
        puts count.to_s + ". ALERT: Credit Card leaked in the clear from " + packet.ip_saddr.to_s + " (HTML)!"
        count += 1	
      end
    end
  end
end
