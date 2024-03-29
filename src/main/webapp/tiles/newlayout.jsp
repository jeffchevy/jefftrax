 <!doctype html>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<html>
	<head>
	<link rel="stylesheet" type="text/css" href="css/skin.css" />
	<link rel="stylesheet" type="text/css" href="CarouselSkeleton_files/style.css" />
	<link rel="stylesheet" type="text/css" href="css/newlayout.css" />
	<link rel="stylesheet" type="text/css" href="CarouselSkeleton_files/jcarousel.responsive.css" />
	<link rel="stylesheet" type="text/css" href="css/forms.css" />
	
	<link type="text/css" href="css/jquery-ui-1.8.10.custom.css" rel="Stylesheet" />
	<!--  
	<link type="text/css" href="DataTables-1.10.2/extensions/TableTools/css/dataTables.tableTools.css" rel="Stylesheet" />
	<link type="text/css" href="DataTables-1.10.2/media/css/jquery.dataTables.css" rel="Stylesheet" />
	 -->
	<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">	
	<link rel="stylesheet" type="text/css" href="css/newlayout.css" />
	
	

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><tiles:insertAttribute name="title" ignore="true" />
	   ScoutTrax.org Free online scout tracking.</title>
	<meta name="keywords" content="Free, online, tracking, software, Boy scout, scout, cub scout, Varsity, Venture, Venturing, Troop, Patrol, Team, Crew, merit badge, 
	requirements, camping, leadership, scout master, scout leader, scout book, rank, Eagle, Eagle Scout, user friendly, easy, 
	simple, parents, awards, tool, email, den, safe, secure, advancement, BSA, "/>

	<style type="text/css">
		input#awardearned[type=checkbox],
		input#awardinprogress[type=checkbox],
		input#allscouts[type=checkbox],
		input.requirementscheckbox[type=checkbox], 
		#scouts input[type=checkbox]
		{
			display:none;
		}

	</style>
	<script type="text/javascript" src="js/new/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="CarouselSkeleton_files/jquery.jcarousel.min.js"></script>
	<script type="text/javascript" src="CarouselSkeleton_files/jcarousel.responsive.js"></script>

	<script type="text/javascript" src="js/new/jquery-ui.js"></script>
	<script type="text/javascript" src="DataTables-1.10.2/media/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="DataTables-1.10.2/extensions/TableTools/js/dataTables.tableTools.js"></script>
	<script type="text/javascript" src="js/SearchHighlight.js" charset="utf-8"></script>
	<script type="text/javascript" src="js/jquery.idletimer.js"></script>   
	<script type="text/javascript" src="js/jquery.idletimeout.js"></script> 
	
	<script type="text/javascript">
		function earned_initCallback(carousel)
		{
			// Disable autoscrolling if the user clicks the prev or next button.
			carousel.buttonNext.bind('click', function() {
				carousel.startAuto(0);
			});
			carousel.buttonPrev.bind('click', function() {
				carousel.startAuto(0);
			});
			
			 // Pause autoscrolling if the user moves with the cursor over the clip.
			carousel.clip.hover(function() {
				carousel.stopAuto();}, 
				function() { carousel.startAuto(); });
		};
		$('#inprogressAwards').jcarousel({
	     	visible: 7,
	     	scroll: 1,
	     	vertical: true
	 	});
		$('#earnedmerritbadges.jcarousel').jcarousel({
		    visible: 13,
			auto: 10,
			scroll: 1,
			wrap: 'last',
			initCallback: earned_initCallback
		});
		var form_submitted = false;
		var id=0;
		function submitScoutNameForm()
		{
			/*console.log("submitting form - size("+$('.scoutName:checked').length+")");*/
			form_submitted = true;
			$('#scoutsform').submit();
			$( "#updatingRecordDialog" ).dialog("open");
			return true;
		}
		$(document).ready(function()
		{
			if($('#ispack').length > 0)
			{
				
			}
			
			if($('.errors').text().length != 0)
			{
				var errorText = $('.errors').map(function() {
				    return "\n "+$(this).text();
				}).get();
			
				// reformat the text by stripping out html elements.
				//alert($('.errors').text().replace('\n', '').replace('<br>','\n').replace('.','.\n'));
				alert(errorText);
				//set focus to the first forms first visible input
				$('input[type!=hidden]:first', 'form:first').focus();
			}
		
		    // for a single scout
			$('.scoutName').click(function(event){
	 			event.stopPropagation();
	 			if(id!==0)
	 			{
	 				//prevent rapid submissions from clobbering each other. 
	 				// wait 2 seconds if nothing happens submit, otherwise restart the timeout
	 				clearTimeout(id); 
	 			}
	 			id = setTimeout('submitScoutNameForm()', 2000)
			});

			$('#scoutimage').click(function(){
                    window.open('scoutreport.html', 'SCOUTREPORT', 'WIDTH=700,HEIGHT=800,resizable=yes,scrollbars=yes,menubar=yes,titlebar=no,toolbar=no,location=no'); w.focus(); return false;
            });
		
			$('#nav-scoutreport').click(function(){
                    window.open('scoutreport.html', 'SCOUTREPORT', 'WIDTH=700,HEIGHT=800,resizable=yes,scrollbars=yes,menubar=yes,titlebar=n,toolbar=no,location=no'); w.focus(); return false;
            });
			//add the active class when a tab is active
			if($('#Scout').length != 0) {$('a', '#nav-scoutrank').addClass('active');}
			else if($('#Tenderfoot').length != 0){$('a', '#nav-tenderfootrank').addClass('active');}
			else if($('#Second_Class').length != 0){$('a', '#nav-2ndclassrank').addClass('active');}
			else if($('#First_Class').length != 0){$('a', '#nav-1stclassrank').addClass('active');}
			else if($('#Star').length != 0){$('a', '#nav-starrank').addClass('active');}
			else if($('#Life').length != 0){$('a', '#nav-liferank').addClass('active');}
			else if($('#Eagle').length != 0){$('a', '#nav-eaglerank').addClass('active');}
			else if($('#Palms').length != 0){$('a', '#nav-palms').addClass('active');}
			else if($('#LeadershipLog').length != 0){$('a', '#nav-leadership').addClass('active');}
			else if($('#ServiceLog').length != 0){$('a', '#nav-service').addClass('active');}
			else if($('#CampLog').length != 0){$('a', '#nav-camping').addClass('active');}
			else if($('#Badges').length != 0){$('a', '#nav-badges').addClass('active');}
			else if($('#DutyToGod').length != 0){$('a', '#nav-dtg').addClass('active');}
			else if($('#Faith').length != 0){$('a', '#nav-faith').addClass('active');}
			else if($('#Awards').length != 0){$('a', '#nav-awards').addClass('active');}
			else if($('#bronze').length != 0){$('a', '#nav-bronze').addClass('active');}
			else if($('#gold').length != 0){$('a', '#nav-gold').addClass('active');}
			else if($('#silver').length != 0){$('a', '#nav-silver').addClass('active');}
			else if($('#ranger').length != 0){$('a', '#nav-ranger').addClass('active');}
			else if($('#Bobcat').length != 0){$('a', '#nav-bobcatrank').addClass('active');}
			else if($('#Tiger_Cub').length != 0){$('a', '#nav-tigerrank').addClass('active');}
			else if($('#Bear').length != 0){$('a', '#nav-bearrank').addClass('active');}
			else if($('#Wolf').length != 0){$('a', '#nav-wolfrank').addClass('active');}
			else if($('#Webelos_Award').length != 0){$('a', '#nav-webelosrank').addClass('active');}
			else if($('#Arrow_Of_Light').length != 0){$('a', '#nav-arrowoflightrank').addClass('active');}
			else if($('#Belt_Loops').length != 0){$('a', '#nav-beltloops').addClass('active');}
			else if($('#Activity_Badges').length != 0){$('a', '#nav-activitybadges').addClass('active');}
			else if($('#Pins').length != 0){$('a', '#nav-pins').addClass('active');}
			else if($('#CubAwards').length != 0){$('a', '#nav-award').addClass('active');}
			
			$('#showscoutsbyunit').change(function() {
			    $(this).closest("form").submit();
			   // "showscoutsby.html?showscoutsby="+this.val();
			});
				    	
			$('#allscouts').click(function() {
				var ischecked = this.checked;
				var $scouts = $('input.scoutName');
				$scouts.attr('checked', ischecked);
				
				$('#scoutsform').submit();
			});
			/*$('#successMessage').dialog({
		        autoOpen: false,
		        modal: true,
		        closeOnEscape: false,
		        draggable: false,
		        resizable: false,
		        buttons: {
		            'Ok': function(){
		                $(this).dialog('close');
		                //set focus to the first forms first visible input
						$('input[type!=hidden]:first', 'form:first').focus();
		            }
		        }
		    });*/
		    
			if($('#successMessage').text().length != 0)
			{
				// reformat the text by stripping out html elements.
				$('#successMessage').text().replace('\n', '').replace('<br>','\n').replace('.','.\n');
				alert($('#successMessage').text());
			    /*todo this does not seem to work with jquery1.4.4 ???????????$( "#successMessage" ).dialog("open");*/
			}
			
		    // session timeout - setup the dialog
		    $("#sessionTimeoutDialog").dialog({
		        autoOpen: false,
		        modal: true,
		        width: 300,
		        height: 180,
		        closeOnEscape: false,
		        draggable: false,
		        resizable: false,
		        buttons: {
		            'Yes, Keep Working': function(){
		                $(this).dialog('close');
		            },
		            'No, Logoff': function(){
		                // fire whatever the configured onTimeout callback is.
		                // using .call(this) keeps the default behavior of "this" being the warning
		                // element (the dialog in this case) inside the callback.
		                $.idleTimeout.options.onTimeout.call(this);
		            }
		        }
		    });
			$( "#updatingRecordDialog" ).dialog({
				resizable: false,
				autoOpen: false,
				width: 340,
				height:140,
				modal: true
			});
		    // cache a reference to the countdown element so we don't have to query the DOM for it on each ping.
		    var $countdown = $("#dialog-countdown");
		   
		    // start the idle timer plugin
		    $.idleTimeout('#sessionTimeoutDialog', 'div.ui-dialog-buttonpane button:first', {
		        idleAfter: 1500, // user is considered idle after 25 minutes
		        warningLength: 90, // show the count down for 90 seconds, give them plenty of time
		        pollingInterval: 60, // a request to keepalive (below) will be sent to the server every 1 minutes
		        keepAliveURL: "$.get('keepAlive.html')",
		        serverResponseEquals: 'OK',
		        onTimeout: function(){
		            window.location = "logout.html";
		        },
		        onIdle: function(){
		            $(this).dialog("open");
		        },
		        onCountdown: function(counter){
		            $countdown.html(counter); // update the counter
		        }
		    });
			$( "#noScoutSelectedDialog" ).dialog({
				resizable: false,
				autoOpen: false,
				width: 340,
				height:160,
				modal: true,
				buttons: {
					"OK": function() {
						$( this ).dialog( "close" );
						return false;
					}
				}
			});
		    
		    /*$('.requirementscheckbox').each(function(){
				$(this).prop("indeterminate", true);
			});*/
		});
		</script>
	</head>
	<body id="body">
	<div id="fb-root"></div>
	<div class='table'>
			<div class='row'>
				<div class='table'>
					<div class='row'>
						<div id='mainmenu' class='cell'>
							<tiles:insertAttribute name="mainmenu" />
						</div>
						<div class='cell'>
							<div class='table'>
								<div id='topmiddle' class='row'>
									<div class='cell'>
											<div id="earned" class="jcarousel-wrapper">
												<div class="jcarousel" data-jcarousel="true">
													<tiles:insertAttribute name="earned" />
												</div>
												<a class="jcarousel-control-prev" href="#" data-jcarouselcontrol="true">&lt;</a> 
												<a class="jcarousel-control-next" href="#" data-jcarouselcontrol="true">&gt;</a>
											</div>
									</div>
								</div>
								<div class='row'>
									<div class='cell'>
										<c:if test="${not empty errorMessage}">
											<span class='errors'>${errorMessage}</span>
										</c:if>
										<c:if test="${not empty successMessage}">
											<div title="ScoutTrax says..." id='successMessage'><p>${successMessage}</p></div>
										</c:if>	
										<div class='table'>
											<div class='row'>
												<div class='cell'>
													<tiles:insertAttribute name="rankmenu" />
												</div>
											</div>
											<div class='row'>
												<div id='pages' class='cell'>
			 										<tiles:insertAttribute name="pages" /> 
												</div>
											</div>
											<div class='row'>
												<tiles:insertAttribute name="footer" /> 
											</div>
										</div>
									</div>
									<div id='scoutnamesColumn' class='cell'>
										<tiles:insertAttribute name="scoutnames" />
									</div>
								</div>
							</div>
						</div>
						<div id='rightcolumn' class='cell'>
							<div class="link">
								<div>Hello, <security:authentication property="principal.firstName" /></div>
								<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----
">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>
								<input id="logout" value="Logout" type="button" class="button" onclick="location.href='logout.html'"/>
								<input value="Support" type="button" class="button" onclick="location.href='showfeedback.html'"/>
							</div>
							 <!-- 
							<div id="fb-root"></div>
								<script>(function(d, s, id) {
								  var js, fjs = d.getElementsByTagName(s)[0];
								  if (d.getElementById(id)) return;
								  js = d.createElement(s); js.id = id;
								  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
								  fjs.parentNode.insertBefore(js, fjs);
								}(document, 'script', 'facebook-jssdk'));</script>
							<div class="fb-like-box" data-href="http://www.facebook.com/ScoutTrax" data-width="50" data-height="50" data-colorscheme="dark" data-show-faces="false" data-border-color="white" data-stream="false" data-header="false"></div>
		  					-->
							<tiles:insertAttribute name="inprogress" />
						</div> <!-- end cell -->
					</div><!-- end row -->
				</div><!-- end table -->
			</div>
			<div class='row' id='rowspacer'></div>
			<div class='row' id='sponsorRow'>
				<div class='table'><!-- create another table so this will span all the whole width -->	
					<div class='row'>
						<tiles:insertAttribute name="sponsor" />
					</div>
				</div>
			</div> <!-- row -->
		</div><!-- table -->

		<!-- dialog window markup -->
		<div id="sessionTimeoutDialog" title="Your session is about to expire!" class="hidden">
		    <p>
		        <span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 50px 0;"></span>
		        You will be logged off in <span id="dialog-countdown" style="font-weight:bold"></span> seconds.
		    </p>
		   
		    <p>Do you want to continue your session?</p>
		</div>
		<div id="updatingRecordDialog" title="Please Wait!" class="hidden">
			<p>
				<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 50px 0;"></span>
				Retrieving records, please wait...
			</p>
		</div>
		<div id="noScoutSelectedDialog" title="Warning!">
			<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;" style="display:none;"></span>
			   You must first select at least one boy scout before performing this action.</p>
		</div>
		</body>
	
</html>