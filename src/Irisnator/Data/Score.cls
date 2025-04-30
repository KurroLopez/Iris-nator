Class Irisnator.Data.Score Extends %Persistent
{

/// Character name
Property CharacterName As %String(MAXLEN = "");

/// Success (Iris-nator has found the character or not)
Property Success As %Boolean;

/// Description
Query GetTopCharacters(pTopScore As %Integer) As %SQLQuery [ SqlProc ]
{
  SELECT TOP :pTopScore %EXACT(CharacterName) as CharacterName, COUNT(1) as Score
  FROM Irisnator_Data.Score
  WHERE Success = 1
  GROUP BY CharacterName
  ORDER BY Score DESC
}

Storage Default
{
<Data name="ScoreDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CharacterName</Value>
</Value>
<Value name="3">
<Value>Success</Value>
</Value>
</Data>
<DataLocation>^Irisnator.Data.ScoreD</DataLocation>
<DefaultData>ScoreDefaultData</DefaultData>
<IdLocation>^Irisnator.Data.ScoreD</IdLocation>
<IndexLocation>^Irisnator.Data.ScoreI</IndexLocation>
<StreamLocation>^Irisnator.Data.ScoreS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
