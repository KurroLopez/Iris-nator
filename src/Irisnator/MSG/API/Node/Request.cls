Class Irisnator.MSG.API.Node.Request Extends (Ens.Response, %JSON.Adaptor, %XML.Adaptor)
{

Property NodeId As %Numeric(%JSONFIELDNAME = "nodeId") [ InitialExpression = 0, Required ];

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>NodeId</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
