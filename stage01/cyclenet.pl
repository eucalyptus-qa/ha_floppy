#!/usr/bin/perl

$sleeptime = shift @ARGV || "5";
$ip = shift @ARGV;
#$echo = "echo";

if (!$ip) {
    print "ERROR: must supply a target ip\n";
    exit(1);
}

sleep 2;

$b=2;
$iface = "";
while($b < 6 && (!$iface || $iface eq "")) {
    print "\tbgrep=$b\n";
    $cmd = "ip addr show |grep 'inet $ip' -B$b | grep BROADCAST | awk '{print \$2}' | sed 's/://g'";
    chomp($iface = `$cmd`);
    $b++;
}
if (!$iface || $iface eq "") {
    print "ERROR: could not find iface for ip $ip\n";
    exit(1);
}
print "halting $iface...$iface\n";

system("$echo ip link set $iface down");
sleep $sleeptime;

print "starting $iface...\n";
system("$echo ip link set $iface up");

exit(0);
