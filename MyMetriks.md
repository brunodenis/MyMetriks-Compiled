1.50 :
	- Modifier paramètre "NODE_UPLOAD_DIR" pour être variable avec root dir C:/MyMetriks/php/upload/ => upload
	- Intégrer nouveau web.config du répertoire nodejs pour lecture distante répertoire iisnode

CKEditor
	Package à télécharger : Plugins
	+ Color Button
	+ Div Editing Area
	+ Font Size and Family
	+ Justify

	Config
		config.language = lang.code || 'fr';
		config.toolbarGroups = [
			{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
			{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
			{ name: 'styles', groups: [ 'styles' ] },
			{ name: 'colors', groups: [ 'colors' ] },
			{ name: 'insert', groups: [ 'insert' ] }
		];

		config.removeButtons = 'Subscript,Superscript,Iframe,Flash,Language,BidiLtr,BidiRtl,CreateDiv,Strike,Styles';

		CKEDITOR.config.fontSize_sizes = '8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px';

		//Set the most common block elements.
		config.format_tags = 'p;h1;h2;h3;pre';

		//Simplify the dialog windows.
		config.removeDialogTabs = 'image:advanced;link:advanced';
		config.removePlugins = 'elementspath,pastefromword,pastetext';
		config.resize_enabled = false;

	Ajouter dans ckeditor/plugins/image/dialog/images.js onClick:function(){var input = this.getInputElement();input.$.accept = 'image/*';} dans l'input type file

Oracle
	Path à modifier pour compilation : 
		SET PATH=C:\MyMetriks\Oracle\;%PATH%
	Surveiller Variable d'environnement PYTHON
		SET PYTHON=C:\python27\python.exe
	Mise à jour NPM : 
		1. find the node_modules/npm/ directory on your system, OP has C:\Users\Administrator\AppData\Roaming\npm\node_modules\npm, cd into that directory
		2. run npm install node-gyp@latest

HighCharts
	Options package à télécharger:
		+ Adapters :
			+ Standalone Framework
		+ Core : 
			+ Core (auto)
		+ Features :
			+ Html
			+ PlotLines or Bands
			+ DateTime axis
			+ Logarithmic axis
			+ Staking
			+ Datalabels
			+ Polar (pour spiderweb)
		- Renderers : Aucun
		+ Dynamics and Interactions :
			+ Tooltip
			+ Interactions
			+ Touch
			+ MS Touch
			+ Dynamics
		+ Chart and serie types :
			+ Line
			+ Area
			+ Spline
			+ AreaSpline
			+ Column
			+ Bar
			+ Scatter
			+ Pie
			+ AreaRange
			+ AreaSplineRange
			+ ColumnRange
			+ Gauge
			+ WaterFall
			+ Bubble
			+ Funnel
		- Stock : aucun
		+ Modules :
			+ Exporting
			+ No data to display
			+ Solid Gauge
			+ Heatmap

IE:{
	Access is denied accessing cssRules => ajouter site dans secure site internet option
	}