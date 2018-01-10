import fnmatch
import os
import obspy

# /net/frumgogn04/data/mseed/2017/VI

#mseeds = glob.glob("./2015/VI.???..HHZ*", recursive=True)
data_directory = "/net/frumgogn04/data/mseed/"
mseeds = []

filter_stations = ["vog", "nyl", "san", "grv", "kri", "vos"]
filter_years = ["2017"]#"2015", "2016", "2017"]

# collect file names
for root, dirnames, filenames in os.walk(data_directory):
    for filename in fnmatch.filter(filenames, '*HHZ*'):
        filepath = os.path.join(root, filename)
        station_ok = False
	year_ok = False
	# lets exclude mseeds we do not want
    	for filter_station in filter_stations:
    		if filename.find(filter_station) > -1:
    			station_ok = True
			break
	for filter_year in filter_years:
		if filepath.find(filter_year) > -1:
			year_ok = True
			break
        if station_ok and year_ok:
        	mseeds.append(filepath)

# assume that the other channels exsits and merge them
for filename_mseed_z in mseeds:
	filename_mseed_e = filename_mseed_z.replace("HHZ", "HHE")
	filename_mseed_n = filename_mseed_z.replace("HHZ", "HHN")
	filename_mseed = filename_mseed_z.replace("HHZ", "HH").split("/")
	filename_mseed = filename_mseed[len(filename_mseed)-1]
	print filename_mseed

	mseed_z = obspy.read(filename_mseed_z)
	mseed_e = obspy.read(filename_mseed_e)
	mseed_n = obspy.read(filename_mseed_n)

	mseed_z.extend(mseed_e)
	mseed_z.extend(mseed_n)

	mseed_z.write("data/"+filename_mseed+".mseed", format='MSEED')
	print filename_mseed_z, filename_mseed_n, filename_mseed_n, " >> ", filename_mseed


