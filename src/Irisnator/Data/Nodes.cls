Class Irisnator.Data.Nodes Extends %Persistent
{

/// NodeId
Property NodeId As %Numeric;

/// Text of the node
Property Text As %String(MAXLEN = "");

/// Type of node (0 = text, 1 = question)
Property Question As %Boolean [ InitialExpression = 0 ];

/// Verb of the question
Property Verb As %String(MAXLEN = "");

/// Get the node name
Query GetNode(nodeId As %Numeric) As %SQLQuery [ SqlProc ]
{
    SELECT NodeId, Verb, Text, Question
    FROM irisnator_data.nodes
    WHERE NodeId = :nodeId
}

Storage Default
{
<Data name="NodesDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>NodeId</Value>
</Value>
<Value name="3">
<Value>Text</Value>
</Value>
<Value name="4">
<Value>Question</Value>
</Value>
<Value name="5">
<Value>Verb</Value>
</Value>
</Data>
<DataLocation>^Irisnator.Data.NodesD</DataLocation>
<DefaultData>NodesDefaultData</DefaultData>
<IdLocation>^Irisnator.Data.NodesD</IdLocation>
<IndexLocation>^Irisnator.Data.NodesI</IndexLocation>
<StreamLocation>^Irisnator.Data.NodesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
