import obspy
import glob

# /net/frumgogn04/data/mseed/2017/VI

#mseeds = glob.glob("./2015/VI.???..HHZ*", recursive=True)
mseeds = glob.iglob("/net/frumgogn04/data/mseed/", recursive=True)

for filename_mseed_z in mseeds:
	filename_mseed_e = filename_mseed_z.replace("HHZ", "HHE")
	filename_mseed_n = filename_mseed_z.replace("HHZ", "HHN")
	filename_mseed = filename_mseed_z.replace("HHZ", "HH")


	#mseed_z = obspy.read(filename_mseed_z)
	#mseed_e = obspy.read(filename_mseed_e)
	#mseed_n = obspy.read(filename_mseed_n)

	#mseed_z.extend(mseed_e)
	#mseed_z.extend(mseed_n)

	#mseed_z.write(filename_mseed, format='MSEED')
	print filename_mseed_z, filename_mseed_n, filename_mseed_n, " >> ", filename_mseed


