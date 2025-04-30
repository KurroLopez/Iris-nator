Class Irisnator.MSG.API.Node.NewNodeRequest Extends (Ens.Response, %JSON.Adaptor, %XML.Adaptor)
{

/// NodeId
Property NodeId As %Numeric(%JSONFIELDNAME = "nodeId");

/// NewCharacter of the node
Property NewCharacter As %String(%JSONFIELDNAME = "newCharacter", MAXLEN = "");

/// OldCharacter of the node
Property OldCharacter As %String(%JSONFIELDNAME = "oldCharacter", MAXLEN = "");

/// Text of the node
Property Text As %String(%JSONFIELDNAME = "text", MAXLEN = "");

/// Verb of the question
Property Verb As %String(%JSONFIELDNAME = "verb", MAXLEN = "");

Storage Default
{
<Data name="NewNodeRequestDefaultData">
<Subscript>"NewNodeRequest"</Subscript>
<Value name="1">
<Value>NodeId</Value>
</Value>
<Value name="2">
<Value>NewCharacter</Value>
</Value>
<Value name="3">
<Value>OldCharacter</Value>
</Value>
<Value name="4">
<Value>Text</Value>
</Value>
<Value name="5">
<Value>Verb</Value>
</Value>
</Data>
<DefaultData>NewNodeRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
