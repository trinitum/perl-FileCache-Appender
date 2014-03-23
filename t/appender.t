use Test::Most;
use Test::FailWarnings;
use FileCache::Appender;

use Path::Tiny;

my $dir = Path::Tiny->tempdir;
my $appender = FileCache::Appender->new( max_open => 2 );

for my $num ( 1 .. 3 ) {
    for my $file (qw(aa bb cc dd)) {
        my $fh = $appender->file( path( $dir, $file ) );
        ok $fh, "Got file handler for $file";
        $fh->syswrite("$num\n");
    }
}

for my $file (qw(aa bb cc dd)) {
    my $path = path( $dir, $file );
    my $content = $path->slurp;
    is $content, "1\n2\n3\n", "File $file contains expected data";
}

dies_ok {
    $appender->file( path( $dir, "subdir", "file" ) );
}
"Failed to open file in non-existing directory";

done_testing;
