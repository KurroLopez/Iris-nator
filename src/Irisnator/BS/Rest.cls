Class Irisnator.BS.Rest Extends (%CSP.REST, Ens.BusinessService)
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
	<Route Url="(?i)/node/:node" Method="GET" Call="GetNode"/>
	<Route Url="(?i)/node" Method="POST" Call="PostNode"/>
    <Route Url="(?i)/score" Method="POST" Call="PostScore"/>
    <Route Url="(?i)/score/:top" Method="GET" Call="GetScore"/>
    <Route Url="(?i)/newscore" Method="POST" Call="PostNewScore"/>
</Routes>
}

Property BusinessNodesConfigName As %String(MAXLEN = "");

Parameter HandleCorsRequest = 1;

Parameter SETTINGS = "BusinessNodesConfigName:Basic:selector?Select=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

ClassMethod GetNode(node) As %Status
{
    do ##class(Ens.Director).CreateBusinessService("Irisnator.BS.Rest", .service)

    set %response.CharSet = "utf-8"
    set %response.ContentType="application/json"

    set pRequest = ##class(Irisnator.MSG.API.Node.Request).%New()
    set pRequest.NodeId = node
    
    set tSC = service.OnProcessInput(pRequest, .pResponse, service.BusinessNodesConfigName)

    if ($$$ISERR(tSC)) {
        set %response.Status = ..#HTTP500INTERNALSERVERERROR
        quit tSC
    }
    set %response.Status= ..#HTTP200OK
    //Do %response.SetHeader("Access-Control-Allow-Origin","*")
    do pResponse.%JSONExportToString(.jsonResponse)
    
    set formatter=##class(%JSON.Formatter).%New()
    do formatter.Format(jsonResponse)
    quit $$$OK
}

ClassMethod PostNode() As %Status
{
    do ##class(Ens.Director).CreateBusinessService("Irisnator.BS.Rest", .service)

    set %response.CharSet = "utf-8"
    set %response.ContentType="application/json"

    set pRequest = ##class(Irisnator.MSG.API.Node.NewNodeRequest).%New()
    
    set tSC = pRequest.%JSONImport(%request.Content)
    
    if ($$$ISERR(tSC)) {
        set %response.Status = ..#HTTP500INTERNALSERVERERROR
        quit tSC
    }
    
    set tSC = service.OnProcessInput(pRequest, .pResponse, service.BusinessNodesConfigName)

    if ($$$ISERR(tSC)) {
        set %response.Status = ..#HTTP500INTERNALSERVERERROR
        quit tSC
    }
    
    set %response.Status= ..#HTTP200OK
    //Do %response.SetHeader("Access-Control-Allow-Origin","*")
    do pResponse.%JSONExportToString(.jsonResponse)
    
    set formatter=##class(%JSON.Formatter).%New()
    do formatter.Format(jsonResponse)
    quit $$$OK
}

ClassMethod PostScore() As %Status
{
    do ##class(Ens.Director).CreateBusinessService("Irisnator.BS.Rest", .service)

    set %response.CharSet = "utf-8"
    set %response.ContentType="application/json"

    set pRequest = ##class(Irisnator.MSG.API.Score.Request).%New()
    set tSC = pRequest.%JSONImport(%request.Content)
    
    if ($$$ISERR(tSC)) {
        set %response.Status = ..#HTTP500INTERNALSERVERERROR
        quit tSC
    }
    
    set tSC = service.OnProcessInput(pRequest, .pResponse, service.BusinessNodesConfigName)

    if ($$$ISERR(tSC)) {
        set %response.Status = ..#HTTP500INTERNALSERVERERROR
        quit tSC
    }
    
    set %response.Status= ..#HTTP200OK
    //Do %response.SetHeader("Access-Control-Allow-Origin","*")
    do pResponse.%JSONExportToString(.jsonResponse)
    
    set formatter=##class(%JSON.Formatter).%New()
    do formatter.Format(jsonResponse)
    quit $$$OK
}

ClassMethod GetScore(top) As %Status
{
    do ##class(Ens.Director).CreateBusinessService("Irisnator.BS.Rest", .service)

    set %response.CharSet = "utf-8"
    set %response.ContentType="application/json"

    set pRequest = ##class(Irisnator.MSG.API.Score.TopScoreRequest).%New()
    set pRequest.TopScore = top
    
    set tSC = service.OnProcessInput(pRequest, .pResponse, service.BusinessNodesConfigName)

    if ($$$ISERR(tSC)) {
        set %response.Status = ..#HTTP500INTERNALSERVERERROR
        quit tSC
    }
    
    set %response.Status= ..#HTTP200OK
    //Do %response.SetHeader("Access-Control-Allow-Origin","*")
    do pResponse.%JSONExportToString(.jsonResponse)
    
    set formatter=##class(%JSON.Formatter).%New()
    do formatter.Format(jsonResponse)
    quit $$$OK
}

ClassMethod PostNewScore() As %Status
{
    do ##class(Ens.Director).CreateBusinessService("Irisnator.BS.Rest", .service)
    #; $$$LOGINFO("JobId: "_$JOB)
    #; kill ^%kurro
    #; set ^%kurro(0)=$JOB
    #; for  {hang 20 break    quit:$get(^%kurro) }
    #; #; just hang around until ^%kurro =1

    set %response.CharSet = "utf-8"
    set %response.ContentType="application/json"

    set pRequest = ##class(Irisnator.MSG.API.Score.NewScoreRequest).%New()
    set tSC = pRequest.%JSONImport(%request.Content)
    
    if ($$$ISERR(tSC)) {
        set %response.Status = ..#HTTP500INTERNALSERVERERROR
        quit tSC
    }
    
    set tSC = service.OnProcessInput(pRequest, .pResponse, service.BusinessNodesConfigName)

    if ($$$ISERR(tSC)) {
        set %response.Status = ..#HTTP500INTERNALSERVERERROR
        quit tSC
    }
    
    set %response.Status= ..#HTTP200OK
    //Do %response.SetHeader("Access-Control-Allow-Origin","*")
    do pResponse.%JSONExportToString(.jsonResponse)
    
    set formatter=##class(%JSON.Formatter).%New()
    do formatter.Format(jsonResponse)
    quit $$$OK
}

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
	// Send a syncro message to BP. 
	//1: pHint — The configuration name of the business process or business operation to which the request is sent.
	//2: pInput — A request message. See Defining Ensemble Messages.
	//3: pOutput — (By reference) A response message. This object receives the data returned by the response.
	//4: pTimeout — (Optional) The number of seconds to wait for a response. The default is –1 (wait forever).
    set tSc = ..SendRequestSync(pHint, pInput, .pOutput)
    
	return tSc
}

ClassMethod OnGetConnections(Output pArray As %String, pItem As Ens.Config.Item)
{
	Do ##super(.pArray,pItem)
	set var = 0

	Set par($Increment(var)) = "BusinessNodesConfigName"
	set par = var

	for i=1:1:par {
		If pItem.GetModifiedSetting(par(i),.tValue) {
		For i=1:1:$L(tValue,",") { Set tOne=$ZStrip($P(tValue,",",i),"<>W")  Continue:""=tOne  Set pArray(tOne)="" }
		}
	}
}

ClassMethod OnPreDispatch() As %Status
{
    Do %response.SetHeader("Access-Control-Allow-Credentials","true")
    Do %response.SetHeader("Access-Control-Allow-Methods","GET, PUT, POST, DELETE, OPTIONS")
    Do %response.SetHeader("Access-Control-Max-Age","10000")
    Do %response.SetHeader("Access-Control-Allow-Headers","Content-Type, Authorization, Accept-Language, X-Requested-With")
    quit $$$OK
}

}
