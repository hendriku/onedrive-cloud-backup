# onedrive-cloud-backup

A solution for backing up the most important things of you linux file systems
into the onedrive cloud. It uses [hendriku/onedrive](https://github.com/hendriku/onedrive) a forked version of [abraunegg/onedrive](https://github.com/abraunegg/onedriv).
This onedrive version **absolutely mandatory** for getting this software to work.

## Installation

Clone the repository and go into it.

```
git clone git@github.com:hendriku/onedrive-cloud-backup.git
cd onedrive-cloud-backup
```

Run the install script with superuser privileges.

```
sudo ./install.sh
```

You will be guided to a dialog for setting up a cronjob.
Add the following line to schedule a backup at midnight for every day.

```
0 0 * * * /recovery/cron.sh
```

For any other scheduling wishes [crontab.guru](https://crontab.guru/) is a great tool.

To get the synchronization to work you will need ondrive to authorize you (see point under "Usage").

## Usage

Now you will have a new user and a directory `/recovery` where backups and logs will be stored.
It also contains the script `cron.sh` which is responsible for synchronization.

### Modify the cronjob

You are able to modify the cronjob even after the setup via executing the following line.

```
sudo crontab -e -u recovery
```

### Execute a backup manually

Login as the recovery user.

```
su recovery
```

You can start the backup progress manually in background.

```
nohup /recovery/cron.sh &
```

Afterwards you can live-access the log via `tail`.

```
tail -f /recovery/logs/backup20XX-YOURDATE/backup20XX-YOURDATE.log
```

### Authorization

Onedrive uses *OAUTH* to verify you. This is a progress for every user.
Therefore you will have to login for the recovery user itself.

Login as the recovery user if you haven't yet.

```
su recovery
```

1. Execute a manual backup to be promted for an authorization uri.
There will be a link before the promt which you will have to open on any desktop client with a web browser (Safari won't work).
2. When opening the link in the web browser onedrive will ask you for your login credentials. Log in with your account.
3. It will ask you if you'd gain permission for a native client. Select Yes.
4. You will now see a white page. Copy the URL of this white page from your web browser and paste it back into your backup client session.

Hit enter and you should now be authorized.

### Excluding files

The files which are excluded can be viewed and changed within the `cron.sh` file.

## License

GNU Public License - v3.0

Use this software for any purpose but don't hold anyone liable.
You are the only one who's responsible for the actions done with this software product.

Written by Hendrik Ulbrich © 2018
