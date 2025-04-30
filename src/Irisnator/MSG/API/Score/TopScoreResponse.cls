Class Irisnator.MSG.API.Score.TopScoreResponse Extends (Ens.Response, %JSON.Adaptor, %XML.Adaptor)
{

Property Score As list Of Irisnator.MSG.API.Score.CharacterNameScore(%JSONFIELDNAME = "score");

Storage Default
{
<Data name="TopScoreResponseDefaultData">
<Subscript>"TopScoreResponse"</Subscript>
<Value name="1">
<Value>Score</Value>
</Value>
</Data>
<DefaultData>TopScoreResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
