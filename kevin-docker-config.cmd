docker create \
--name=plex \
--net=host \
-e PUID=1000 -e PGID=1000 \
-v /sharedfolders/FD_docker/plex/config/:/config \
-v /sharedfolders/HD_HI.3TB/CENTER/:/data/tvshows \
-v /srv/dev-disk-by-label-HI_3TBc2/CENTER/:/data/movies \
-v /home/kevin/transcode/:/transcode \
-v /srv/dev-disk-by-label-BAK.3TB.WD/CENTER-DEVOPS/:/data/devops \
-v /srv/dev-disk-by-label-BAK.3TB.WD/PHOTO-UPLOAD/:/data/photo \
-v /srv/dev-disk-by-label-HI_3TBc2/MUSIC/:/data/music \
-v /srv/dev-disk-by-label-Segate.Movie.Center2.C4/MOVIES/:/data/segate-movies \
-v /home/kevin/transcode/:/transcode \
lsioarmhf/plex