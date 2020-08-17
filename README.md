# TokenScript-debugger

#### Steps to Debug / View TokenScript xml file using ts-debugger.xsl:

1. Download / clone the repository.

2. Open your TokenScript.xml file and add the xml-stylesheet processing instruction with relative or absolute href path to the ts-debugger.xsl. This will be the second line in your TokenScript XML file as shown below.
	
    ```
    <?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <?xml-stylesheet href="../../../TokenScript-debugger/ts-debugger.xsl" type="text/xsl"?>
    ```
  
3. Most of the browsers does not support loading of local referenced file due to security policy. Considering this need to either run the TokenScript XML file in local HTTP server or perform below one time setting on Google Chrome.
  
   Steps to enable Google Chrome to load the local file references.
	   - Right click on Google Chrome icon 
	   - Go to Properties 
	   - Go target field to add --allow-access-from-files as shown below.
     
       
       "your_path\chrome.exe" --allow-access-from-files
     
4. Now Start the Google Chrome browser and open / drag TokenScript XML file to view it.
