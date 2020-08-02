function loadIframe(){
	var iframes = document.getElementsByTagName("iframe");
	for(var i=0; i<iframes.length; i++){
		var iframe = iframes[i];
		var textContent = iframe.textContent;
		var wrapper = document.createElement('div');
		wrapper.innerHTML = textContent;
		var containrDiv = wrapper.getElementsByClassName("container");
		
		var CSS = wrapper.getElementsByClassName("css")[0];
		var script = wrapper.getElementsByClassName("script")[0];
		var body = wrapper.getElementsByClassName("body")[0];
		if(CSS || script){
			
			if(CSS){
				var style = document.createElement("style");
				style.setAttribute("type", "text/css");
				style.textContent = CSS.textContent;
				$(iframe).contents().find("head").html(style);
			}
			if(script){
				var script = document.createElement("script");
				script.setAttribute("type", "text/javascript");
				script.textContent = script.textContent;
				$(iframe).contents().find("head").html(script);
			}
		}
		if(body)
			iframe.contentDocument.write(body.innerHTML);
		iframe.textContent = "";
	}

}