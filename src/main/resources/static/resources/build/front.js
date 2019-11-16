//Frontend Demo
//Just corrects asset paths for demo of Ace
var fs = require('fs');

//this is used for grunt
if(typeof module !== 'undefined') {

 module.exports = function fixPreview(grunt) {
	//iterate over all pages and generate the static html file
	var folder = __dirname+'/../frontend';
	var regex_search = new RegExp("assets\/(css|js)\/(\.+)\.(css|js)" , "gi");
	var replace_callback = function(text, a1, a2, a3, a4) {
		return "dist/"+a1+"/"+a2+".min."+a3;
	}
	
	var regex_search2 = new RegExp("assets\/" , "gi");
	var replace_callback2 = function(text) {
		return "dist/";
	}
	
	
	if(fs.existsSync(folder) && (stats = fs.statSync(folder)) && stats.isDirectory()) {
		var files = fs.readdirSync(folder)
		files.forEach(function (name) {
			var filename;//file name, which we use as the variable name
			if (! (filename = name.match(/(:?.+?)\.(html)$/)) ) return;
			if (filename[0] == 'index.html') return;
			
			var fileContent = fs.readFileSync(folder + '/' + filename[0] , 'utf-8');
			fileContent = fileContent.replace(regex_search , replace_callback).replace(regex_search2 , replace_callback2);
			
			fs.writeFileSync(folder + '/' + filename[0] + '.min' ,  fileContent, 'utf-8');
		})
	}
 }
 
}
