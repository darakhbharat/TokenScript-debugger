function loadIframe(){
	var iframes = document.getElementsByTagName("iframe");
	var div = document.getElementsByClassName("iframeContent");
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
		doc.write(div[i].innerHTML);
		doc.close();
	}
}

function init(){
	var coll = document.getElementsByClassName("collapsible");

	for (var i = 0; i < coll.length; i++) {
	  coll[i].addEventListener("click", function() {
		this.classList.toggle("active");
		var content = this.nextElementSibling;
		if (content.style.display === "block") {
			content.style.display = "none";
		} else {
			content.style.display = "block";
		}
	});
}
	
}	