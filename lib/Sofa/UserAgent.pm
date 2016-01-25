use v6;
use HTTP::UserAgent;
use URI::Template;
use HTTP::Request::Common;

class Sofa::UserAgent is HTTP::UserAgent {
    has Str  $.host = 'localhost';
    has Int  $.port = 5984;
    has Bool $.secure = False;
    has Str  $.base-url;
    has URI::Template $!base-template;
    has      %.default-headers = (Accept => "application/json", Content-Type => "application/json");

    role Response {
        multi method from-json() {
            from-json(self.content);
        }

    }

    method base-url() returns Str {
        if not $!base-url.defined {
            $!base-url = 'http' ~ ($!secure ?? 's' !! '') ~ '://' ~ $!host ~ ':' ~ $!port.Str ~ '/{+path}';
        }
        $!base-url;
    }

    method base-template() returns URI::Template handles <process> {
        if not $!base-template.defined {
            $!base-template = URI::Template.new(template => self.base-url);
        }
        $!base-template;
    }

    multi method get(:$path!, *%headers) returns Response {
        self.request(GET(self.process(:$path), |%!default-headers, |%headers)) but Response;
    }

    multi method put(Str :$path!, Str :$content, *%headers) returns Response {
        self.request(PUT(self.process(:$path), :$content, |%!default-headers, |%headers)) but Response;
    }

    multi method put(Str :$path!, :%content, *%headers) returns Response {
        self.put(:$path, content => to-json(%content), |%headers);
    }

    multi method post(Str :$path!, Str :$content, *%headers) returns Response {
        self.request(POST(self.process(:$path), :$content, |%!default-headers)) but Response;
    }

    multi method post(Str :$path!, :%content, *%headers) returns Response {
        self.post(:$path, content => to-json(%content), |%headers);
    }


    multi method delete(Str :$path!, *%headers) returns Response {
        self.request(DELETE(self.process(:$path), |%!default-headers, |%headers)) but Response;
    }

}
# vim: expandtab shiftwidth=4 ft=perl6