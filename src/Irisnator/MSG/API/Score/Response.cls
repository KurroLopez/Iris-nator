Class Irisnator.MSG.API.Score.Response Extends (Ens.Response, %JSON.Adaptor, %XML.Adaptor)
{

/// Total number of games
Property TotalScore As %Integer(%JSONFIELDNAME = "totalScore") [ InitialExpression = 0 ];

/// Number of games with success
Property TotalSuccess As %Integer(%JSONFIELDNAME = "totalSuccess") [ InitialExpression = 0 ];

/// Number of games with failure
Property TotalFail As %Integer(%JSONFIELDNAME = "totalFail") [ InitialExpression = 0 ];

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>TotalScore</Value>
</Value>
<Value name="2">
<Value>TotalSuccess</Value>
</Value>
<Value name="3">
<Value>TotalFail</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
