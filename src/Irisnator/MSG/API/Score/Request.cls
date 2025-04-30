Class Irisnator.MSG.API.Score.Request Extends (Ens.Response, %JSON.Adaptor, %XML.Adaptor)
{

/// Character name
Property CharacterName As %String(%JSONFIELDNAME = "characterName", MAXLEN = "");

/// Success (Iris-nator has found the character or not)
Property Success As %Boolean(%JSONFIELDNAME = "success") [ InitialExpression = 0 ];

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>CharacterName</Value>
</Value>
<Value name="2">
<Value>Success</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
