Sample code:
<cfsavecontent variable="exampletext"><pre style="border: 1px dashed black; background-color: #CCFF99; margin: 0; padding: 6px;">
&lt;cf_querysim name="mytable"&gt;
Title,Varchar|Body,Varchar
Test3|This is my body, this a very long body
Test 4|Body body body
Test 5|Body for row 3
Test 6|Blah Body!
&lt;/cf_querysim&gt;
&lt;cfdump var="#mytable#"&gt;</pre>
</cfsavecontent>
<cfoutput>#exampletext#</cfoutput><br />
Produces:
<cf_querysim name="mytable">
Title,Varchar|Body,Varchar
Test3|This is my body, this a very long body
Test 4|Body body body
Test 5|Body for row 3
Test 6|Blah Body!
</cf_querysim>
<cfdump var="#mytable#">