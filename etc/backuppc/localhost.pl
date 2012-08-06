#
# Local server backup of /etc as user backuppc
#
$Conf{XferMethod} = 'tar';

$Conf{TarShareName} = [
  '/'
];

$Conf{TarClientCmd} = '/usr/bin/env LC_ALL=C /usr/bin/sudo $tarPath -c -v -f - -C $shareName --totals';

# remove extra shell escapes ($fileList+ etc.) that are
# needed for remote backups but may break local ones
$Conf{TarFullArgs} = '$fileList';
$Conf{TarIncrArgs} = '--newer=$incrDate $fileList';
$Conf{BackupFilesExclude} = {
  '*' => [
    '/usr/lost+found',
    '/var/run',
    '/var/games',
    '/var/spool',
    '/var/cache',
    '/var/lock',
    '/var/tmp',
    '/var/lost+found',
    '/var/lib/backuppc',
    '/var/log',
    '/backup',
    '/data',
    '/dev',
    '/media',
    '/mount',
    '/proc',
    '/home/*/.mozilla/*/*/Cache',
    '/home/*/.mozilla/*/*/Cache.Trash',
    '/lost+found ',
    '/mnt',
    '/sys',
    '/tmp',
    "/home/*/\x{417}\x{430}\x{433}\x{440}\x{443}\x{437}\x{43a}\x{438}",
    "/home/*/\x{41c}\x{443}\x{437}\x{44b}\x{43a}\x{430}",
    '/home/*/tmp',
    '/home/*/.thumbnails',
    '/home/*/.rvm',
    '/home/*/.wine',
    '/home/*/.PlayOnLinux',
    '/home/*/.vmware'
  ]
};
$Conf{TarClientRestoreCmd} = '/usr/bin/env LC_ALL=C /usr/bin/sudo $tarPath -x -p --numeric-owner --same-owner -v -f - -C $shareName+';
$Conf{ClientCharset} = 'utf8';
