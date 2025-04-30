Class Irisnator.MSG.API.Score.NewScoreRequest Extends (Ens.Request, %JSON.Adaptor, %XML.Adaptor)
{

/// Character name
Property CharacterName As %String(%JSONFIELDNAME = "characterName", MAXLEN = "");

Storage Default
{
<Data name="NewScoreRequestDefaultData">
<Subscript>"NewScoreRequest"</Subscript>
<Value name="1">
<Value>CharacterName</Value>
</Value>
</Data>
<DefaultData>NewScoreRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
