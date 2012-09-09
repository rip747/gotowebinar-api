# gotowebinar-api

A ColdFusion API for GotoWebinar

## Usage

To create an instance of the API, pass in your `access token` and `organizer key` to the API's init method:

```
  <cfset AccessToken = "<your access token>">
  <cfset OrganizerKey = "<your organizer key>">
  <cfset webinarObj = createObject("_lib.gotowebinar").init(AccessToken,OrganizerKey)>
```

Once an instance has been created you may call methods against the API.

A complete list of the API methods can be found [here][1].

The following is an example of creating a registrant for a webinar:

```
  <!--- your account settings for GotoWebinar --->
  <cfset AccessToken = "<your access token>">
  <cfset OrganizerKey = "<your organizer key>">
  <!--- create an instance of the api --->
  <cfset webinarObj = createObject("_lib.gotowebinar").init(AccessToken,OrganizerKey)>

  <!--- create a struct that will hold information about the registrant --->
  <cfset webinar_key = "<id of the webinar>">
  <cfset params = {}>
  <cfset params["email"] = "<email of the registrant>">
  <cfset params["firstName"] = "<first name of the registrant>">
  <cfset params["lastName"] = "<last name of the registrant>">
	
  <!--- call the create_registrant method of the API passing the registrant information --->
  <cftry>
    <cfset result = webinarObj.create_registrant(webinar_key, params)>
    <cfcatch type="any">
      <cfset result = {}>
    </cfcatch>
  </cftry>

  <cfif !StructIsEmpty(result)>
    Success!
  <cfelse>
    Failure
  </cfif>
```

## Support

If you have an issue, open a ticket in the [issue tracker][2].

**I AM NOT TAKING FEATURE REQUESTS**

If there is something this API wrapper is missing, fork the repo **AND CODE IT YOURSELF**

[1]: https://developer.citrixonline.com/api-overview/gotowebinar-rest-api
[2]: https://github.com/rip747/gotowebinar-api/issues