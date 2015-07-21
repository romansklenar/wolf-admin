Hi, I hope you find this theme useful!

Here are some docs for the HTML version and info to get started.


CSS folder structure:

/bootstrap: the original css bootstrap files, if you want to change versions, just drop and replace them here and put your overrides in _bootstrap-overrides.scss.

/vendor: in here are all the plugins, libraries and external stuff used throughout the theme.

/modules: contains reusable element styles like new buttons, form control styles, etc plus the mixins library with some cool helpers used for the theme.

/partials:
	/pages: contains all the pages styles separated by html page, each one is uniquely contained by adding an ID into the body of their respective page, like a namespace.

	/snippets: in here are blocks of styles for html sections that can be reusable in different pages, e.g. the Screenshots Slider used in the landing page and in the features page reuse the same styles located in snippets.

	_config.scss: is used to import fonts and apply variables used throughout the scss files.
	
	_layout.scss: contains the styles that apply for the layout of the theme, in this case the navbar header and the footer.


Everything is imported onto the theme.scss file using the @import statement except for vendor files (these are referenced explicitly in each page when needed). The compiled file for the theme.scss is located under compiled/theme.css, this way the html pages only reference a single file which makes it easier to maintain.

If you prefer to use normal css, there's the expanded-theme.css which has all the styles in an expanded format, it's easy to edit styles thanks to the body ID that identifies each page.


************


Fonts folder:
contains all the font files used in the theme:
	- Brankic icon set
	- Entypo icon set
	- Flexslider icon set
	- Font awesome set
	- Glyphicons set
	- Icomoon set
	- Ionicons set


************


Images folder: images used in the theme.


************

JS folder:	

/bootstrap: the original bootstrap js files, to change versions replace them here with the new ones.

/vendor: all the js libraries and plugins used.


************

Icons folder:

Includes the downloaded files from http://icomoon.io/app for the Brankic, Entypo and Icomoon free icon fonts set:
Brankic: http://www.brankic1979.com/icons/
Icomoon: http://icomoon.io/#icons
Entypo: http://www.entypo.com/

You don't need any of this, as the css font files are already in the vendor folder, but you can use the demo.html in each folder to see all of the icons included and how to reference them in css classes.


************

Credits:

- unsplash.com for bg pictures.
- uifaces.com/authorized for the user display pics.
- fontawesome.io
- entypo.com
- brankic1979.com/icons
- ionicons.com
- elegantthemes.com for the Flat Circle Icons found at graphicburger.com/90-beautiful-flat-icons 


Image Shots:

https://dribbble.com/shots/1455878-ADCltd
https://dribbble.com/shots/1480456-Billable
https://dribbble.com/shots/1491212-Raindrop-new-Landing
https://dribbble.com/shots/1479077-Dribbbox
https://dribbble.com/shots/1451134-Checkout
https://dribbble.com/shots/1450972-Survey-dashboard-wip
https://dribbble.com/shots/1452942-Origami-Facebook
https://dribbble.com/shots/1417727-Payments-Dashboard
https://dribbble.com/shots/1348013-Dashboard-Redesign


Plugins:

- Animate.css     [www.daneden.me/animate]
- Bootstrap Daterangepicker     [http://github.com/dangrossman/bootstrap-daterangepicker]
- Bootstrap Switch     [www.bootstrap-switch.org]
- Bootstrap Datepicker     [eternicode.github.io/bootstrap-datepicker]
- FullCalendar     [arshaw.com/fullcalendar]
- jQuery Datatables     [https://datatables.net]
- jQuery Minicolors     [https://github.com/claviska/jquery-miniColors]
- Offline     [http://github.com/HubSpot/offline]
- Select2     [http://github.com/ivaynberg/select2]
- Shepherd     [http://github.com/HubSpot/shepherd]
- Summernote     [http://hackerwins.github.io/summernote]
- Flot Charts		[http://www.flotcharts.org]
- Messenger		[https://github.com/HubSpot/messenger]
- jQuery Validate		[github.com/jzaefferer/jquery-validation]
- Highlight.js		[highlightjs.org]
- Imagesloaded		[https://github.com/desandro/imagesloaded]
- jQuery Cookie 	[https://github.com/carhartl/jquery-cookie]
- jQuery Masked input		[https://github.com/digitalBush/jquery.maskedinput]
- jQuery Raty		[http://wbotelhos.com/raty]
- Moment.js 		[http://momentjs.com]
- Zoomerang			[http://yyx990803.github.io/zoomerang]
- Morris.js 		[oesmith.github.com/morris.js]
- Raphael.js (Morris dependency)		[http://raphaeljs.com]

- jQuery v2.1.0		[http://jquery.com]
- jQuery UI v1.10.4		[http://jqueryui.com]
- Bootstrap v3.1.1 		[http://getbootstrap.com]


************

Changelog

v1.0
- Initial release

v1.1
- Added a js helper to get date timestamps with moment.js to use on flot charts


*** 

For any help, doubts, suggestions, ideas for new features/pages to keep improving this theme or just want to say hi you can contact me at e.adrian90 at gmail.com

