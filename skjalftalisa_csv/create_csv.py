import json
import requests
import datetime

url = 'https://dev-api.vedur.is/skjalftalisa/v1/quakefilter/'

payload = {
    "depth_min":0,
    "depth_max":30,
    "size_min":-2,
    "size_max":7,
    "start_time":"2015-01-01 00:00:00",
    "end_time":"2018-01-01 00:00:00",
    "area":[[63.41119772365924,-21.184043884277344],[64.24698161075293,-21.002769470214847],[64.2374330029458,-23.980064392089844],[63.389061297647125,-24.051475524902347]],
    "event_type":["qu"],
    "originating_system":["SIL picks"],
    "magnitude_preference":["Ml"]
}

resp = requests.post(url=url, data=json.dumps(payload))
data = json.loads(resp.text)

# enumerate through geometries
print ",id,origintime,latitude,longitude,depth,err_lon,err_lat,err_depth,err_origintime,county,origin_src,prefmag,pmag_type,pmag_src,mw,mw_src,mblg_ogs,mblg_usgs,ml_ogs,m3hz_ogs,md_ogs,mb,ms,mfa,max_mmi,reafile,reamtime,geom,pdlid,mw_ogs,utc_timestamp"
row_counter = 0
for geom in data:
    prop = geom["properties"]
    utf_time = datetime.datetime.fromtimestamp(prop["time"])
    stmp_time = prop["time"]
    print str(row_counter) + ","+ \
        str(prop["event_id"])+",", \
        utf_time.isoformat()+",",\
        str(geom["geometry"]["coordinates"][0])+",", \
        str(geom["geometry"]["coordinates"][1])+",",\
        str(prop["depth"])+",",\
        "0,",\
        "0,",\
        "0,",\
        "0,",\
        "IS,",\
        "SIL,",\
        str(prop["magnitude"])+",",\
        str(prop["magnitude_type"]).upper()+",",\
        "OGS,",\
        ",",\
        ",",\
        ",",\
        ",",\
        str(prop["magnitude"])+",",\
        ",",\
        ",",\
        ",",\
        ",",\
        ",",\
        "0,",\
        "/home/analyst/REA/OGS__/2014/01/...,", \
        datetime.datetime.now().isoformat()+",",\
        "0101000020E6100000541D7233DC3A58C0053411363C154240,",\
        "3982.0",\
        ",", \
        ",", \
        stmp_time
    row_counter = row_counter + 1


"""
=0,
id=9973,
origintime=2014-01-01 00:32:48.281999,
latitude=36.17085,
longitude=-96.91487,
depth=5.0,
err_lon=0.9,
err_lat=1.4,
err_depth=5.4,
err_origintime=0.28,
county=PAYNE,
origin_src=OGS,
prefmag=1.8,
pmag_type=ML,
pmag_src=OGS,
mw=,
mw_src=,
mblg_ogs=,
mblg_usgs=,
ml_ogs=1.8,
m3hz_ogs=,
md_ogs=,
mb=,
ms=,
mfa=,
max_mmi=0,
reafile=/home/analyst/REA/OGS__/2014/01/01-0032-36L.S201401,
reamtime=2016-01-28 15:49:08.56102,
geom=0101000020E6100000541D7233DC3A58C0053411363C154240,
pdlid=3982.0,
mw_ogs=,
utc_timestamp=1388536368.28

,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,


"""

#print data
