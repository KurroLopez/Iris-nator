Class Irisnator.MSG.API.Score.TopScoreRequest Extends (Ens.Request, %JSON.Adaptor, %XML.Adaptor)
{

Property TopScore As %Integer(%JSONFIELDNAME = "topScore") [ InitialExpression = 10 ];

Storage Default
{
<Data name="TopScoreRequestDefaultData">
<Subscript>"TopScoreRequest"</Subscript>
<Value name="1">
<Value>TopScore</Value>
</Value>
</Data>
<DefaultData>TopScoreRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
