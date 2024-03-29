<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<style type="text/css">
body {
	background: black;
	color: black;
	margin: 0;
}

h1 {
	color: black;
}

.table {
	width: 100%
}

#centerlogo {
	margin-left: auto;
	margin-right: auto;
	width: 50%;
	background: black;
}

#centertop {
	padding: 2% 30% 2% 30%;
	width: 40% white-space: nowrap;
	text-align: center;
	background: white;
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

#bottom {
	margin: 0;
	background: white;
}

#bottomCenterImage
{
	margin:0;
 	background: white;
}
#bottomTable
 {
	margin: 0.4em auto 0 auto;
	width: 67em;
	background: white;
}

#theList {
	text-align: center;
	padding: 0;
	margin: 0;
	font-family: Verdana, Arial;
	color: white;
	background: black;
}

#testimonials {
	text-align: center;
	padding: 0;
	margin: 0;
	font-family: Verdana, Arial;
	font-size: 2em;
}

#scouttraxlogo {
	height: 445px;
}

#black {
	background: black;
	width: 100%;
}
</style>
<link type="text/css" href="css/jquery-ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.11.2.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.youtubepopup.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#username').focus();
		$('#about').click(function() {
			window.open('scoutTraxUserGuide.html', 'About ScoutTrax', 'WIDTH=800,HEIGHT=800,resizable=yes,scrollbars=yes,menubar=no,titlebar=no');
			w.focus();
			return false;
		});
		$('a.youtube').YouTubePopup({
			autoplay : 1,
			hideTitleBar : true,
			clickOutsideClose : true,
			showBorder : false
		});
	});
</script>

<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
	<span style="color: red">${SPRING_SECURITY_LAST_EXCEPTION.message}</span>
	<!-- Login failed due to: this was always appearing so comment out until we find the problem-->
</c:if>

</head>
<body class='black'>
	<div class="table">
		<div id="centerlogo" class="row">
			<table>
				<tr>
					<td><a id="nav-home" title='Home' href='home.html'> <img
							id='scouttraxlogo' alt="Scout Trax Logo"
							src="images/scouttrax_logo.png" />
					</a></td>
					<td><a id="nav-home" title='Login' href='login.html'> <img
							alt="Scout Trax Login" src="images/taketour.png" />
					</a></td>
				</tr>
				<tr>
					<td><a id="nav-home" title='Login' href='login.html'> <img
							class="startNow" alt="Scout Trax Login" src="images/startnow.png" />
					</a></td>
					<td></td>
				</tr>
			</table>
		</div>
		<hr>
		<div id="theList" class="row">Tiger Cub - Wolf - Bear - Webelos
			- 11 Year Old - Scouts - Varsity - Venture - Duty to God</div>
		<div id="bottomCenterImage" class="">
			<div id="bottom" class='action'>
				<table id="bottomTable">
					<tr>
						<td>
							<table id="standardVideos">
								<tr>
									<td>
										<table>
											<td><a class="youtube" href="#" rel="uLbM6YGSswA"
												title="Getting Started"> <img alt="Getting Started"
													src="images/gettingstarted.png" /></a></td>

											<td><a class="youtube" href="#" rel="hN9LmH3xmHY"
												title="Features of Scout trax"> <img
													alt="About Scouting" src="images/features.png"></a></td>
											<td><a class="youtube" href="#" rel="oE7emvBDwys"
												title="Advanced features for leaders"> <img
													alt="Features for Leaders" src="images/extrafeatures.jpg"></a>
											</td>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="prop">
											<tr>
												<td>
													<p id='testimonials'>be free!</p> <iframe
														src="https://player.vimeo.com/video/126026782?title=0&byline=0&portrait=0"
														width="371" height="211" frameborder="0"
														webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
												</td>
												<td>
													<p id='testimonials'>testimonials</p> <iframe
														src="https://player.vimeo.com/video/126076298?title=0&byline=0&portrait=0"
														width="372" height="211" frameborder="0"
														webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td>
							<table border="1" cellpadding="4">
							<tr><td>
								<a class=""
									href="http://www.colonialflag.com/content/scouttrax/index.html"
									title="Fund Raising"> <img alt="Colonial Flag"
									src="images/supporter/Colonial Flag large.jpg" />
								</a>
								</td></tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>

	</div>
</body>