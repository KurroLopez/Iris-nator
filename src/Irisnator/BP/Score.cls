/// 
Class Irisnator.BP.Score Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Irisnator.MSG.API.Score.Request' response='Irisnator.MSG.API.Score.Response' height='2000' width='2000' >
<sequence xend='200' yend='650' >
<sql name='InsertScore' xpos='200' ypos='250' >
<![CDATA[INSERT INTO Irisnator_Data.Score(CharacterName, Success)
VALUES (:request.CharacterName, :request.Success)]]>
</sql>
<sql name='TotalScore' xpos='200' ypos='350' >
<![CDATA[ SELECT COUNT(1) 
 INTO :response.TotalScore
 FROM Irisnator_Data.Score]]>
</sql>
<sql name='TotalSuccess' xpos='200' ypos='450' >
<![CDATA[ SELECT COUNT(1) 
 INTO :response.TotalSuccess
 FROM Irisnator_Data.Score
 WHERE Success = 1]]>
</sql>
<sql name='TotalFail' xpos='200' ypos='550' >
<![CDATA[ SELECT COUNT(1) 
 INTO :response.TotalFail
 FROM Irisnator_Data.Score
 WHERE Success = 0]]>
</sql>
</sequence>
</process>
}

}
