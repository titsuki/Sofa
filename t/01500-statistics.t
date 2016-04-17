#!perl6

use v6;

use Test;
use Sofa::Statistics;

my $json = '{"couchdb":{"auth_cache_misses":{"description":"number of authentication cache misses","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"database_writes":{"description":"number of times a database was changed","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"open_databases":{"description":"number of open databases","current":1.0,"sum":1.0,"mean":0.0,"stddev":0.0050000000000000001041,"min":0,"max":1},"auth_cache_hits":{"description":"number of authentication cache hits","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"request_time":{"description":"length of a request inside Sofa without MochiWeb","current":2464.9349999999999454,"sum":2464.9349999999999454,"mean":79.513999999999995794,"stddev":204.48199999999999932,"min":0.5,"max":908.0},"database_reads":{"description":"number of times a document was read from a database","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"open_os_files":{"description":"number of file descriptors Sofa has open","current":2.0,"sum":2.0,"mean":0.0,"stddev":0.010000000000000000208,"min":0,"max":2}},"httpd_request_methods":{"PUT":{"description":"number of HTTP PUT requests","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"GET":{"description":"number of HTTP GET requests","current":92.0,"sum":92.0,"mean":0.0010000000000000000208,"stddev":0.075999999999999998113,"min":0,"max":11},"COPY":{"description":"number of HTTP COPY requests","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"DELETE":{"description":"number of HTTP DELETE requests","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"POST":{"description":"number of HTTP POST requests","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"HEAD":{"description":"number of HTTP HEAD requests","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null}},"httpd_status_codes":{"403":{"description":"number of HTTP 403 Forbidden responses","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"202":{"description":"number of HTTP 202 Accepted responses","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"401":{"description":"number of HTTP 401 Unauthorized responses","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"409":{"description":"number of HTTP 409 Conflict responses","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"200":{"description":"number of HTTP 200 OK responses","current":55.0,"sum":55.0,"mean":0.0010000000000000000208,"stddev":0.044999999999999998335,"min":0,"max":6},"405":{"description":"number of HTTP 405 Method Not Allowed responses","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"400":{"description":"number of HTTP 400 Bad Request responses","current":2.0,"sum":2.0,"mean":0.0,"stddev":0.0070000000000000001457,"min":0,"max":1},"201":{"description":"number of HTTP 201 Created responses","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"404":{"description":"number of HTTP 404 Not Found responses","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"500":{"description":"number of HTTP 500 Internal Server Error responses","current":2.0,"sum":2.0,"mean":0.0,"stddev":0.010999999999999999362,"min":0,"max":1},"412":{"description":"number of HTTP 412 Precondition Failed responses","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"301":{"description":"number of HTTP 301 Moved Permanently responses","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"304":{"description":"number of HTTP 304 Not Modified responses","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null}},"httpd":{"clients_requesting_changes":{"description":"number of clients for continuous _changes","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"temporary_view_reads":{"description":"number of temporary view reads","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"requests":{"description":"number of HTTP requests","current":92.0,"sum":92.0,"mean":0.0010000000000000000208,"stddev":0.085999999999999993117,"min":0,"max":17},"bulk_requests":{"description":"number of bulk requests","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null},"view_reads":{"description":"number of view reads","current":null,"sum":null,"mean":null,"stddev":null,"min":null,"max":null}}}';

my $obj;

lives-ok { $obj = Sofa::Statistics.from-json($json) }, "make a Sofa::Statistics from json";

done-testing;
# vim: expandtab shiftwidth=4 ft=perl6