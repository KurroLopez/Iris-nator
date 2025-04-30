/// 
Class Irisnator.BP.TopScore Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Irisnator.MSG.API.Score.TopScoreRequest' response='Irisnator.MSG.API.Score.TopScoreResponse' height='2000' width='2000' >
<context>
<property name='ListCharacterName' type='%String' collection='list' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='ListScore' type='%Integer' collection='list' instantiate='0' />
</context>
<sequence xend='200' yend='450' >
<code name='ListScore' xpos='200' ypos='350' >
<![CDATA[ set scores = ##class(Irisnator.Data.Score).%New()
 set resultset = scores.GetTopCharactersFunc(request.TopScore)
 while resultset.%Next()
 { 
   set score = ##class(Irisnator.MSG.API.Score.CharacterNameScore).%New()
   set score.CharacterName = resultset.%Get("CharacterName")
   set score.Score = resultset.%Get("Score")
   Do response.Score.Insert(score)
 }]]>
</code>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
