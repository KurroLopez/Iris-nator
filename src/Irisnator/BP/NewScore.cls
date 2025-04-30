/// 
Class Irisnator.BP.NewScore Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Irisnator.MSG.API.Score.NewScoreRequest' response='Irisnator.MSG.API.Score.NewScoreResponse' height='2000' width='2000' >
<sequence xend='200' yend='350' >
<sql name='NewScore' xpos='200' ypos='250' >
<![CDATA[ INSERT INTO Irisnator_data.score(CharacterName,Success)
 VALUES (:request.CharacterName,1)]]>
</sql>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
