# mapnik-styles
This repository contains custom styles for use with the Mapnik map rending engine, and Open StreetMap data.

Mapnik can be used to create static maps, or tiles for slippy maps. These styles require an PostGIS database with Open StreetMap data to render.

The repo comes with some complimentary shapefiles, some of which have unclear licences, and with some default J++ server setups. The repo is therefore private.

## OSM Bright
This is our clone of [mapbox/osm-bright](https://github.com/mapbox/osm-bright), a great general purpose map.

Use `osm2pgsql` to populate a PostGIS database called `gis`, and you are good to go. Try it with Nik4:

    nik4.py  -b 12.54 56.6 13.6 56.8 --size-px 800 400 osm-bright.xml test.png


##Toner Light
This is our clone of the [Stamen Toner](https://github.com/stamen/toner-carto) variety *Toner Light*, for when you want the data to speak, and the map to shut up.

Use `imposm3` to populate a PostGIS database called `imposm`, run the [modified High Road SQL script](https://github.com/stamen/toner-carto/blob/master/sql/functions/highroad.sql), and you are good to go. Try it with Nik4:

    nik4.py  -b 12.54 56.6 13.6 56.8 --size-px 800 400 toner-lite.xml test.png

Here is an `imposm3` example:

    imposm3 import -mapping toner-light_imposm3_mapping.json -connection postgis://ubuntu:ubuntu@localhost/imposm -read ../planet/sweden-latest.osm.pbf -write -deployproduction

    export PGPASSWORD ubuntu
    psql -h localhost -d imposm -U ubuntu -p 5432 -f sql/highroad.sql -a


##Setting up the server
To fetch all OSM data and extract it while downloading (quickest):

    wget -O - ftp://ftp5.gwdg.de/pub/misc/openstreetmap/planet.openstreetmap.org/planet/planet-latest.osm.bz2 | bzcat >planet_latest.osm

