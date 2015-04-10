<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<style type="text/css">
		body {
			background: white;
			color: black;
			margin: 0;
		}
		h1 {
			color: black;
		}
		.table {width: 100%}
		#centerlogo {
			padding: 1% 45% 1% 14%;
			width:50%;
			background: black;
		}
		#centertop {
			padding: 2% 30% 2% 30%;
			width: 40%
			white-space: nowrap;
			text-align: center;
			background:white;
		}
		.biginput {
			color: black;
		}
		#logo {
			position: fixed;
			left: 15%;
			top: 24%;
			z-index: -1;
			border: none;
		}
		img {
			border: none;
		}
		.startNow {
		    margin-left: 30%;
   			margin-top: 15px;
		}
		.row {
			padding: 20px;
		}
		#loginFormat {
			right: 30%;
			position: relative;
		}
		#topCenterImage {
			margin: 2% auto;
			width: 58%;
			background: white;
		}
		#bottomCenterImage {
			margin: 2em auto 0 auto;
			width: 47em;
			background: white;
		}
		#theList {
			text-align:center; 
			padding:0;
			margin:0;
			font-family:Verdana,Arial;
		}
		.row {
			padding: 0;
		}
		.vcenter {
		    display: inline-block;
		    vertical-align: middle;
		    float: none;
		}
	</style>
	<link type="text/css" href="css/jquery-ui.all.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.11.2.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.youtubepopup.min.js"></script>
	
	 <script type="text/javascript">
		$(document).ready(function()
		{ 
			$('#username').focus();	
			$('#about').click(function(){
                    window.open('scoutTraxUserGuide.html', 'About ScoutTrax', 'WIDTH=800,HEIGHT=800,resizable=yes,scrollbars=yes,menubar=no,titlebar=no'); w.focus(); return false;
            });	
            $('a.youtube').YouTubePopup({ 
	            	autoplay: 1, 
	            	hideTitleBar: true,
	            	clickOutsideClose: true,
	            	showBorder: false
	            	});
		});
	</script>
		 
	<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
			<span style="color: red">${SPRING_SECURITY_LAST_EXCEPTION.message}</span>
			<!-- Login failed due to: this was always appearing so comment out until we find the problem--> 
	</c:if>

</head>
<body>
	<div class="table">
		<div id="centerlogo"  class="row">
			<table>
				<tr>
					<td><a id="nav-home" class="vcenter" title='Home' href='home.html'><img alt="Scout Trax Logo" src="images/scouttrax_logo.png" /></a></td>
					<td><a class="vcenter" title='Login' href='login.html'><img class="startNow" alt="Scout Trax Login" src="images/StartNowText.png" /></a></td>
				</tr>
			</table>
		</div>
		<div id="theList" class="row">Tiger Cub - Wolf - Bear - Webelos - 11 Year Old - Scouts - Varsity - Venture - Duty to God</div>
		<div id="bottomCenterImage" class="row" >
			<div class='action'>
			<table>
				<tr>
		 			<td>
						<a class="youtube" href="#" rel="uLbM6YGSswA" title="Getting Started">
							<img alt="Getting Started" src="images/gettingstarted.png"/></a>
					</td>
					
					<td>
						<a class="youtube" href="#" rel="hN9LmH3xmHY" title="Features of Scout trax">
							<img alt="About Scouting" src="images/features.png"></a>
					</td>
					<td>
						<a class="youtube" href="#" rel="oE7emvBDwys" title="Advanced features for leaders">
							<img alt="Features for Leaders" src="images/extrafeatures.jpg"></a>
					</td>
				</tr>
			</table>
			</div>	
		</div>

	</div>
	</body>