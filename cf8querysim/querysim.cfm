<!--- // 
Author: Todd Rafferty (webRat@gmail.com)
Description: Updated code based on an old concept of a query simulator.  
Noteables:
- Querysim was initially written by Hal Helms ( http://www.halhelms.com/code/resources/QuerySim.zip ).
- QuerySim() function was written by Bert Dawson ( http://www.cflib.org/udf.cfm?ID=255 ).
--->
<cfif thisTag.HasEndTag IS FALSE><cfthrow message="No &lt;/cf_querysim&gt; closure." detail="You must close all querysim calls."><cfexit method="exittag"></cfif>
<cfif thisTag.ExecutionMode EQ "END">
	<cfset LF = CHR(10)>
	<cfset L2A = ListToArray(trim(stripCR(thisTag.generatedContent)),LF,'no')>
	<cfset thisTag.GeneratedContent = "">
	<cfset col_names = "">
    <cfset col_dtypes = "">
    <!--- // Get The Query Information --->
    <cfloop index="column" list="#L2A[1]#" delimiters="|">
    	<cfif listLen(column) LT 2>
        	<cfthrow message="Invalid Query Header" detail="1st row doesn't appear to be the column header / datatypes for this query.  Please refer to the non-existant documentation and try again.">
		</cfif>
		<cfset col_names = listAppend(col_names,listFirst(column))>
        <cfset col_dtypes = listAppend(col_dtypes,listLast(column))>
    </cfloop>
    <!--- // DELETE 1st row which should be the column headers --->
    <cfset ArrayDeleteAt(L2A,1)>
    <!--- // Create Temp Query Object --->
    <cfset tempQuery = queryNew(col_names,col_dtypes)>
    <cfloop array="#L2A#" index="row">
    	<cfset queryAddRow(tempQuery)>
		<cfloop index="qcolumn" list="#col_names#" delimiters=",">
        	<cfset PIL = listFind(col_names,qcolumn)>
        	<cfset querySetCell(tempQuery,qcolumn,listGetAt(row,PIL,'|'))>
        </cfloop>
    </cfloop>
    <cfset caller[attributes.name] = duplicate(tempQuery)>
</cfif>