package Data::BinaryBuffer;
use strict;
use warnings;

# ABSTRACT: The module to work with binary data effectively
our $VERSION = '0.005'; # VERSION

require XSLoader;
XSLoader::load('Data::BinaryBuffer', $VERSION);

1;

__END__

=pod

=encoding utf-8

=head1 NAME

Data::BinaryBuffer - The module to work with binary data effectively

=head1 VERSION

version 0.005

=head1 SYNOPSIS

    use Data::BinaryBuffer;

    my $buf = Data::BinaryBuffer->new;

    $buf->write($some_data); # PSD file for ex

    my $sig = $buf->read(4);
    die "This is not PSD file" if $sig ne '8BPS';

    my $version = $buf->read_uint16be;

    # etc...

=head1 DESCRIPTION

NOTE: This module is in very alpha state. API may change without any notice until version 0.1.

Perl is good for strings, bug not very nice to binary data. This class exactly for that.

Data::BinaryBuffer is a data structure similar to the queue, but optimized to work with blocks of arbitrary size.
You can write data to one end of buffer and read from another. Data can be written or read in various formats.

=encoding utf-8

=head1 METHODS

=head2 new

  my $buf = Data::BinaryBuffer->new;

Creates empty buffer object.

=head2 size

  my $size = $buf->size;

Returns current amount of bytes stored in buffer.

=head2 write

  $buf->write($data);

Write scalar to the buffer.

=head2 write_uint8

=head2 write_uint16be

=head2 write_uint16le

=head2 write_uint32be

=head2 write_uint32le

=head2 write_int8

=head2 write_int16be

=head2 write_int16le

=head2 write_int32be

=head2 write_int32le

  $buf->write_uint8(255);
  $buf->write_int32be($value);

Write one integer to the buffer.

=head2 read

  my $data = $read($size);

Read $size bytes to Perl scalar.

=head2 read_uint8

=head2 read_uint16be

=head2 read_uint16le

=head2 read_uint32be

=head2 read_uint32le

=head2 read_int8

=head2 read_int16be

=head2 read_int16le

=head2 read_int32be

=head2 read_int32le

  my $num1 = $buf->read_uint32be;

Read integer from buffer.

=head2 read_buffer

  my $buf2 = $buf->read_buffer($size);

Same as C<read>, but return another buffer.
This method is very fast for big data.

=head1 SEE ALSO

=over 4

=item *

pack/unpack functions in perldoc

=item *

L<File::Binary>

=item *

L<Parse::Binary>

=item *

L<Convert::Binary::C>

=back

=for :stopwords cpan testmatrix url annocpan anno bugtracker rt cpants kwalitee diff irc mailto metadata placeholders metacpan

=head1 SUPPORT

=head2 Bugs / Feature Requests

Please report any bugs or feature requests through the issue tracker
at L<https://github.com/vovkasm/data-binarybuffer/issues>.
You will be notified automatically of any progress on your issue.

=head2 Source Code

This is open source software.  The code repository is available for
public review and contribution under the terms of the license.

L<https://github.com/vovkasm/data-binarybuffer>

  git clone git://github.com/vovkasm/data-binarybuffer.git

=head1 AUTHOR

Vladimir Timofeev <vovkasm@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Vladimir Timofeev.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
