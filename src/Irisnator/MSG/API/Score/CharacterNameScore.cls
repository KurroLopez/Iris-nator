Class Irisnator.MSG.API.Score.CharacterNameScore Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

/// Character name
Property CharacterName As %String(%JSONFIELDNAME = "characterName", MAXLEN = "");

/// Score of this character
Property Score As %Integer(%JSONFIELDNAME = "score");

Storage Default
{
<Data name="CharacterNameScoreState">
<Value name="1">
<Value>CharacterName</Value>
</Value>
<Value name="2">
<Value>Score</Value>
</Value>
</Data>
<State>CharacterNameScoreState</State>
<StreamLocation>^Irisnator5277.CharacterNa2508S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
