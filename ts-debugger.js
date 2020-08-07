function loadIframe(){
	var iframes = document.getElementsByTagName("iframe");
	var div = document.getElementsByClassName("iframe");
	for(var i=0; i<iframes.length; i++){
		var iframe = iframes[i];
		/*var textContent = iframe.textContent;
		var wrapper = document.createElement('div');
		wrapper.innerHTML = textContent;
		
		iframeContentDocument = iframe.contentWindow.document;
		iframeContentDocument.write(wrapper.innerHTML);
		iframe.textContent = "";
		*/
		var doc = iframe.contentWindow.document;
		doc.open();
		doc.write(div[0].innerHTML);
		doc.close();
	}
}