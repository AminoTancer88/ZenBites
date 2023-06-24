#!/usr/bin/perl

use strict;
use warnings;

use CGI;

$CGI::POST_MAX = 1024 * 100;

my $cgi = new CGI;

print $cgi->header;

print <<EOT;
<html>
  <head>
    <title>An Online Healthy Snack Delivery Service</title>
    <style type="text/css">
      body {
        background-color: white;
      }
      h1 {
        text-align: center;
      }
      p {
        font-size: 16px;
        font-style: italic;
      }
    </style>
  </head>
  <body>

    <h1>An Online Healthy Snack Delivery Service</h1>

    <p>Welcome to our online snack delivery service! We are dedicated to providing
    healthy snacks to our customers, whether they be at home, work, or school!
    We offer a wide variety of snacks, including granola bars, trail mix, nuts,
    fruits, and more! Our mission is to make sure that everyone has access to
    the same healthy snacks.</p>

EOT

if ($cgi->param('name') && $cgi->param('email')) {
  my $name = $cgi->param('name');
  my $email = $cgi->param('email');
  print <<"EOT";
    <p>Thank you for signing up, $name! We've added you to our list of
    customers, and you will receive emails with updates about our services.
    We're so glad you've chosen us as your healthy snack delivery service!</p>
EOT
} else {
  print <<"EOT";
    <form method="post" action="delivery.pl">
      <p>Sign up now to receive emails with updates about our services:</p>
      <p>Name: <input type="text" name="name" /></p>
      <p>Email: <input type="text" name="email" /></p>
      <p><input type="submit" value="Sign up!" /></p>
    </form>
EOT

}

print <<"EOT";
  </body>
</html>
EOT