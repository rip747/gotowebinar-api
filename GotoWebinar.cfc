<cfcomponent output="true" hint="component to interface with citrixonline GotoWebinar">


	<cffunction name="init">
		<cfargument name="access_token" type="string" required="true" hint="access token for api calls">
		<cfargument name="organizer_key" type="string" required="true" hint="organizer key for api calls">

		<cfset variables.access_token = arguments.access_token>
		<cfset variables.organizer_key = arguments.organizer_key>
		
		<cfset variables.default_params = {}>
		
		<cfset variables.default_params.base_uri = "https://api.citrixonline.com/G2W/rest/organizers/#variables.organizer_key#/">
		<cfset variables.default_params.headers = {}>
		<cfset variables.default_params.headers["Content-type"] = "application/json">
		<cfset variables.default_params.headers["Accept"] = "application/json">
		<cfset variables.default_params.headers["Authorization"] = "OAuth oauth_token=#variables.access_token#">
		
		<cfset StructDelete(arguments, "access_token", false)>
		<cfset StructDelete(arguments, "organizer_key", false)>
		
		<cfset StructAppend(variables.default_params, arguments, true)>
		
		<cfreturn this>
	</cffunction>

	<!--- sessions --->

	<cffunction name="get_organizer_sessions">
		<cfreturn get("sessions")>
	</cffunction>
    
	<cffunction name="get_session">
		<cfargument name="webinar_key" type="string" required="true">
		<cfargument name="session_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/sessions/#arguments.session_key#")>
	</cffunction>
    
	<cffunction name="get_session_attendees">
		<cfargument name="webinar_key" type="string" required="true">
		<cfargument name="session_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/sessions/#arguments.session_key#/attendees")>
	</cffunction>
    
	<cffunction name="get_session_performance">
		<cfargument name="webinar_key" type="string" required="true">
		<cfargument name="session_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/sessions/#arguments.session_key#/performance")>
	</cffunction>
    
	<cffunction name="get_session_polls">
		<cfargument name="webinar_key" type="string" required="true">
		<cfargument name="session_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/sessions/#arguments.session_key#/polls")>
	</cffunction>
    
	<cffunction name="get_session_questions">
		<cfargument name="webinar_key" type="string" required="true">
		<cfargument name="session_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/sessions/#arguments.session_key#/questions")>
	</cffunction>
    
	<cffunction name="get_session_surveys">
		<cfargument name="webinar_key" type="string" required="true">
		<cfargument name="session_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/sessions/#arguments.session_key#/surveys")>
	</cffunction>
    
	<cffunction name="get_webinar_sessions">
		<cfargument name="webinar_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/sessions")>
	</cffunction>
	
	<!--- attendees --->
	
	<cffunction name="get_attendee">
		<cfargument name="webinar_key" type="string" required="true">
		<cfargument name="session_key" type="string" required="true">
		<cfargument name="registrant_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/sessions/#arguments.session_key#/attendees/#arguments.registrant_key#")>
	</cffunction>
	
	<cffunction name="get_attendee_poll_answers">
		<cfargument name="webinar_key" type="string" required="true">
		<cfargument name="session_key" type="string" required="true">
		<cfargument name="registrant_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/sessions/#arguments.session_key#/attendees/#arguments.registrant_key#/polls")>
	</cffunction>

	<cffunction name="get_attendee_questions">
		<cfargument name="webinar_key" type="string" required="true">
		<cfargument name="session_key" type="string" required="true">
		<cfargument name="registrant_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/sessions/#arguments.session_key#/attendees/#arguments.registrant_key#/questions")>
	</cffunction>
    
	<cffunction name="get_attendee_survey_answers">
		<cfargument name="webinar_key" type="string" required="true">
		<cfargument name="session_key" type="string" required="true">
		<cfargument name="registrant_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/sessions/#arguments.session_key#/attendees/#arguments.registrant_key#/surveys")>
	</cffunction>

	<cffunction name="get_attendees_for_all_webinar_sessions">
		<cfargument name="webinar_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/attendees")>
	</cffunction>
		
	<!--- registrants --->
	
	<cffunction name="create_registrant">
		<cfargument name="webinar_key" type="string" required="true">
		<cfargument name="params" type="struct" required="true">
		<cfset var loc = {}>
		<cfset loc.args = []>
		<cfset loc.temp = {}>
		<cfset loc.temp.type = "body">
		<cfset loc.temp.value = SerializeJSON(arguments.params)>
		<cfset ArrayAppend(loc.args, loc.temp)>
		<cfreturn post("webinars/#arguments.webinar_key#/registrants", loc.args)>
	</cffunction>
    
	<cffunction name="get_registrant">
		<cfargument name="webinar_key" type="string" required="true">
		<cfargument name="registrant_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/registrants/#arguments.registrant_key#")>
	</cffunction>

	<cffunction name="get_registrants">
		<cfargument name="webinar_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/registrants")>
	</cffunction>

	<cffunction name="get_registrant_fields">
		<cfargument name="webinar_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/registrants/fields")>
	</cffunction>
	
	<!--- webinars --->
	
	<cffunction name="get_historical_webinars">
		<cfargument name="params" type="struct" required="false" default="#StructNew()#">
		<cfset var loc = {}>
		<cfset loc.args = []>
		<cfloop collection="#arguments.params#" item="loc.param">
			<cfset loc.temp = {}>
			<cfset loc.temp.type = "url">
			<cfset loc.temp.name = loc.param>
			<cfset loc.temp.value = arguments.params[loc.param]>
			<cfset ArrayAppend(loc.args, loc.temp)>
		</cfloop>
		<cfreturn get("historicalWebinars", loc.args)>
	</cffunction>

	<cffunction name="get_upcoming_webinars">
		<cfargument name="params" type="struct" required="false" default="#StructNew()#">
		<cfset var loc = {}>
		<cfset loc.args = []>
		<cfloop collection="#arguments.params#" item="loc.param">
			<cfset loc.temp = {}>
			<cfset loc.temp.type = "url">
			<cfset loc.temp.name = loc.param>
			<cfset loc.temp.value = arguments.params[loc.param]>
			<cfset ArrayAppend(loc.args, loc.temp)>
		</cfloop>
		<cfreturn get("upcomingWebinars", loc.args)>
	</cffunction>

	<cffunction name="get_webinar">
		<cfargument name="webinar_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#")>
	</cffunction>

	<cffunction name="get_webinar_meeting_times">
		<cfargument name="webinar_key" type="string" required="true">
		<cfreturn get("webinars/#arguments.webinar_key#/meetingTimes")>
	</cffunction>

	<cffunction name="get_webinars">
		<cfreturn get("webinars")>
	</cffunction>	

	<!--- private methods --->
	
	<cffunction name="get" access="private">
		<cfargument name="urlPart" type="string" required="true">
		<cfargument name="params" type="array" required="false" default="#ArrayNew(1)#">
		<cfreturn makeHttpCall("get", arguments.urlPart, arguments.params)>
	</cffunction>

	<cffunction name="post" access="private">
		<cfargument name="urlPart" type="string" required="true">
		<cfargument name="params" type="array" required="false" default="#ArrayNew(1)#">
		<cfreturn makeHttpCall("post", arguments.urlPart, arguments.params)>
	</cffunction>
	
	<cffunction name="makeHttpCall" access="private">
		<cfargument name="method" type="string" required="true">
		<cfargument name="urlPart" type="string" required="true">
		<cfargument name="params" type="array" required="false" default="#ArrayNew(1)#">
		<cfset var loc = {}>
		<cfset loc.ret = {}>

		<cfhttp url="#variables.default_params.base_uri##arguments.urlPart#" method="#arguments.method#" result="loc.value" throwonerror="false" timeout="5">
			<cfif IsStruct(variables.default_params.headers)>
				<cfloop collection="#variables.default_params.headers#" item="loc.header">
					<cfhttpparam type="header" name="#loc.header#" value="#variables.default_params.headers[loc.header]#">
				</cfloop>
			</cfif>
				<cfif !ArrayIsEmpty(arguments.params)>
				<cfloop array="#arguments.params#" index="loc.param">
					<cfif IsStruct(loc.param)>
						<cfhttpparam attributeCollection="#loc.param#">
					</cfif>
				</cfloop>				
			</cfif>
		</cfhttp>

		<cfif IsJSON(loc.value.filecontent)>
			<cfset loc.ret = DeserializeJSON(loc.value.filecontent)>
		</cfif>

		<cfreturn loc.ret>
	</cffunction>

</cfcomponent>