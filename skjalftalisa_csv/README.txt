var geojson = [
	{
	    "type": "Feature",
	    "properties": {"party": "Republican"},
	    "geometry": {
	        "type": "Polygon",
	        "coordinates": [[
	            [-97.6, 36],
	            [-97.4,35.85],
	            [-97.2, 35.85],
	            [-97.3,35.75],
	            [-97.4,35.95],
	            [-97.6,35.75]
	        ]]
	    }
	},
	{
	    "type": "Feature",
	    "properties": {"party": "xxx"},
	    "geometry": {
	        "type": "Point",
	        "coordinates": [-97.454860, 35.796570]
	    }
	},
	{
	    "type": "Feature",
	    "properties": {"party": "xxx"},
	    "geometry": {
	        "type": "LineString",
	        "coordinates": [[-97.454860, 35.796570], [-97.29, 35.72]]
	    }
	}			
]
L.geoJSON(geojson).addTo(map);
map.panTo([48.99, -104.05])
