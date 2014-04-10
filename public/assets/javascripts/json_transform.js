var fs = require('fs');

var trains = require('./station_data.json');

var stationData = [];

for(var i = 0; i < trains.length; i++) {
	var code = trains[i].code;
	var tks = trains[i].name.split(' ').concat(code);
	stationData.push(
		{
			tokens: tks,
			value: trains[i].name,
			code: code
		}
	);
}

stations = JSON.stringify(stationData);

fs.writeFile("public/json/rail_stations.json", stations, function(err) {
    if(err) {
        console.log(err);
    } else {
        console.log("The file was saved!");
    }
});
